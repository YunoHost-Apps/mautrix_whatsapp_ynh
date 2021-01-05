#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="g++ postgresql ffmpeg"
GO_VERSION="1.14"
GO_PATH="/usr/lib/go-$GO_VERSION/bin"

#=================================================
# PERSONAL HELPERS
#=================================================

# Detect the system architecture to download the right tarball
# NOTE: `uname -m` is more accurate and universal than `arch`
# See https://en.wikipedia.org/wiki/Uname
if [ -n "$(uname -m | grep 64)" ]; then
	architecture="amd64"
elif [ -n "$(uname -m | grep 86)" ]; then
	architecture="386"
elif [ -n "$(uname -m | grep arm)" ]; then
	architecture="armv6l"
else
	ynh_die "Unable to detect your achitecture, please open a bug describing \
        your hardware and the result of the command \"uname -m\"." 1
fi

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
