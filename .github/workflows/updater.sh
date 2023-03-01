#!/bin/bash

#=================================================
# PACKAGE UPDATING HELPER
#=================================================

# This script is meant to be run by GitHub Actions
# The YunoHost-Apps organisation offers a template Action to run this script periodically
# Since each app is different, maintainers can adapt its contents so as to perform
# automatic actions when a new upstream release is detected.

#=================================================
# FETCHING LATEST RELEASE AND ITS ASSETS
#=================================================

# Fetching information
current_version=$(cat manifest.json | jq -j '.version|split("~")[0]')
repo=$(cat manifest.json | jq -j '.upstream.code|split("https://github.com/")[1]')
# Some jq magic is needed, because the latest upstream release is not always the latest version (e.g. security patches for older versions)
version=$(curl --silent "https://api.github.com/repos/$repo/releases" | jq -r '.[] | select( .prerelease != true ) | .tag_name' | sort -V | tail -1)
assets=($(curl --silent "https://api.github.com/repos/$repo/releases" | jq -r '[ .[] | select(.tag_name=="'$version'").assets[].browser_download_url ] | join(" ") | @sh' | tr -d "'"))
tarball=$(curl --silent "https://api.github.com/repos/$repo/releases" | jq -r '[ .[] | select(.tag_name=="'$version'").tarball_url ] | join(" ") | @sh' | tr -d "'")

# Later down the script, we assume the version has only digits and dots
# Sometimes the release name starts with a "v", so let's filter it out.
# You may need more tweaks here if the upstream repository has different naming conventions. 
if [[ ${version:0:1} == "v" || ${version:0:1} == "V" ]]; then
    version=${version:1}
fi

# Setting up the environment variables
echo "Current version: $current_version"
echo "Latest release from upstream: $version"
echo "VERSION=$version" >> $GITHUB_ENV
# For the time being, let's assume the script will fail
echo "PROCEED=false" >> $GITHUB_ENV

# Proceed only if the retrieved version is greater than the current one
if ! dpkg --compare-versions "$current_version" "lt" "$version" ; then
    echo "::warning ::No new version available"
    exit 0
# Proceed only if a PR for this new version does not already exist
elif git ls-remote -q --exit-code --heads https://github.com/$GITHUB_REPOSITORY.git ci-auto-update-v$version ; then
    echo "::warning ::A branch already exists for this update"
    exit 0
fi

# Each release can hold multiple assets (e.g. binaries for different architectures, source code, etc.)
echo "${#assets[@]} available asset(s)"

#=================================================
# UPDATE SOURCE FILES
#=================================================

# Here we use the $assets variable to get the resources published in the upstream release.
# Here is an example for Grav, it has to be adapted in accordance with how the upstream releases look like.

# Let's loop over the array of assets URLs
for asset_url in ${assets[@]}; do

echo "Handling asset at $asset_url"

# Assign the asset to a source file in conf/ directory
# Here we base the source file name upon a unique keyword in the assets url (admin vs. update)
# Leave $src empty to ignore the asset
case $asset_url in
  *"amd64")
    src="amd64"
    ;;
  *"arm")
    src="armhf"
    ;;
  *"arm64")
    src="arm64"
    ;;
  *)
    src=""
    ;;
esac

# If $src is not empty, let's process the asset
if [ ! -z "$src" ]; then

# Create the temporary directory
tempdir="$(mktemp -d)"

# Download sources and calculate checksum
filename=${asset_url##*/}
curl --silent -4 -L $asset_url -o "$tempdir/$filename"
curl --silent -4 -L $tarball -o "$tempdir/$version"
checksum=$(sha256sum "$tempdir/$filename" | head -c 64)

# Rewrite source file
cat <<EOT > conf/$src.src
SOURCE_URL=$asset_url
SOURCE_SUM=$checksum
SOURCE_SUM_PRG=sha256sum
SOURCE_IN_SUBDIR=false
SOURCE_FILENAME=mautrix-whatsapp
SOURCE_EXTRACT=false
EOT
echo "... conf/$src.src updated"

else
echo "... asset ignored"
fi

done

#=================================================
# SPECIFIC UPDATE STEPS
#=================================================

# Any action on the app's source code can be done.
# The GitHub Action workflow takes care of committing all changes after this script ends.

echo "Update latest version of conf/config.yaml"
# Update the config.yaml with the latest version of it and add vars that will be replaced
configFilePath="conf/config.yaml"
newConfigFilePath=$(tar -tf "$tempdir/$version" |  grep 'example-config.yaml')
tar -xf "$tempdir/$version" --directory "$tempdir" "$newConfigFilePath"
mv "$tempdir/$newConfigFilePath" "$configFilePath"

# Replace default values with vars that will be replaced on the install script
yq -i '.homeserver.address = "https://__DOMAIN__"' $configFilePath
yq -i '.homeserver.domain = "__SERVER_NAME__"' $configFilePath
yq -i '.homeserver.async_media = "__ASYNC_MEDIA__"' $configFilePath
yq -i '.appservice.address = "http://localhost:__PORT__"' $configFilePath
yq -i '.appservice.port = "__PORT__"' $configFilePath
yq -i '.appservice.database.uri = "postgres://__APP__:__DB_PWD__@localhost:5432/__DB_NAME__"' $configFilePath
yq -i '.appservice.id = "__APPSERVICEID__"' $configFilePath
yq -i '.appservice.bot.username = "__BOTNAME__"' $configFilePath
yq -i '.appservice.bot.displayname = "__DISPLAYNAME__"' $configFilePath
yq -i '.appservice.bot.avatar = "__AVATAR__"' $configFilePath
yq -i '.appservice.ephemeral_events = "__EPHEMERAL_EVENTS__"' $configFilePath
yq -i '.metrics.enabled = "__ENABLE_METRICS__"' $configFilePath
yq -i '.metrics.listen = "__LISTEN_PORT__"' $configFilePath
yq -i '.whatsapp.os_name = "__OS_NAME__"' $configFilePath
yq -i '.whatsapp.browser_name = "__BROWSER_NAME__"' $configFilePath
yq -i '.bridge.username_template = "__USERNAME_TEMPLATE__"' $configFilePath
yq -i '.bridge.personal_filtering_spaces = "__PERSONAL_FILTERING_SPACES__"' $configFilePath
yq -i '.bridge.delivery_receipts = "__DELIVERY_RECEIPTS__"' $configFilePath
yq -i '.bridge.send_presence_on_typing = "__SEND_PRESENCE_ON_TYPING__"' $configFilePath
yq -i '.bridge.url_previews = "__URL_PREVIEWS__"' $configFilePath
yq -i '.bridge.encryption.allow = "__ENCRYPTION__"' $configFilePath
yq -i '.bridge.encryption.default = "__ENCRYPTION_DEFAULT__"' $configFilePath
yq -i '.bridge.encryption.require = "__ENCRYPTION_REQUIRE__"' $configFilePath
yq -i 'with(.bridge.permissions ; . = { "__LISTRELAY__": "relay", "__LISTUSER__": "user", "__LISTADMIN__": "admin" } | ... style="double")' $configFilePath
yq -i '.bridge.relay.enabled = "__ENABLE_RELAYBOT__"' $configFilePath
yq -i '.bridge.relay.admin_only = "__ADMIN_ONLY__"' $configFilePath
yq -i '.logging.directory = "/var/log/__APP__"' $configFilePath
yq -i '.logging.print_level = "__PRINT_LEVEL__"' $configFilePath

## Keep some default options turned off
yq -i '.logging.file_name_format = "null"' $configFilePath


#=================================================
# GENERIC FINALIZATION
#=================================================

# Replace new version in manifest
echo "$(jq -s --indent 4 ".[] | .version = \"$version~ynh1\"" manifest.json)" > manifest.json

# Delete temporary directory
rm -rf $tempdir

# No need to update the README, yunohost-bot takes care of it

# The Action will proceed only if the PROCEED environment variable is set to true
echo "PROCEED=true" >> $GITHUB_ENV
exit 0
