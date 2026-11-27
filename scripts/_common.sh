#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

get_synapse_db_name() {
	# Parameters: synapse instance identifier
	# Returns: database name
	ynh_app_setting_get --app="$1" --key=db_name
}

#=================================================
# CONFIG PANEL SETTERS
#=================================================

apply_permissions() {
    set -o noglob # Disable globbing to avoid expansions when passing * as value.
    declare values="list$role"
    newValues="${!values}" # Here we expand the dynamic variable we created in the previous line. ! Does the trick
    newValues="${newValues//\"}"
    # Split on commas only and trim surrounding whitespace, so that a value containing spaces
    # (e.g. a leftover placeholder sentence) is never split into several bogus entries.
    IFS=',' read -r -a rawArray <<< "$newValues"
    usersArray=()
    for user in "${rawArray[@]}"; do
        user="${user#"${user%%[![:space:]]*}"}"
        user="${user%"${user##*[![:space:]]}"}"
        [ -n "$user" ] && usersArray+=("$user")
    done

    if [ ${#usersArray[@]} -gt 0 ]
    then
        # Only touch the "permissions:" block of the bridge section (it ends at the top-level "database:" key).
        allDefinedEntries=$(sed -n '/^    permissions:/,/^database:/p' "$install_dir/config.yaml" | sed '1d;$d' | sed '/^ *#/d' | grep -v -E ": \"?$role\"?$" | sed -E 's/^ *"?([^"]*)"?: .*/\1/')
        # Delete everything from the corresponding role to insert the new defined values. This way we also handle deletion of users.
        sed -i -E "/^    permissions:/,/^database:/{/: \"?$role\"?$/d;}" "$install_dir/config.yaml"
        for user in "${usersArray[@]}"
        do
            if grep -q -x -F "${user}" <<< "$allDefinedEntries"
            then
                ynh_print_info "User $user already defined in another role."
            else
                sed -i "/^    permissions:/a \        \\\"$user\\\": $role" "$install_dir/config.yaml" # Whitespaces are needed so that the file can be correctly parsed
            fi
        done
    fi
    set +o noglob

    ynh_print_info "Users with role $role added in $install_dir/config.yaml"
}

set__listuser() {
  role="user"
  ynh_app_setting_set --key=listuser --value="$listuser"
  apply_permissions
  ynh_store_file_checksum "$install_dir/config.yaml"
}

set__listrelay() {
  role="relay"
  ynh_app_setting_set --key=listrelay --value="$listrelay"
  apply_permissions
  ynh_store_file_checksum "$install_dir/config.yaml"
}

set__listadmin() {
  role="admin"
  ynh_app_setting_set --key=listadmin --value="$listadmin"
  apply_permissions
  ynh_store_file_checksum "$install_dir/config.yaml"
}
