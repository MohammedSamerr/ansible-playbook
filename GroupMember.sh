#/bin/bash

get_users_in_group(){
    group_name="$1"
    users=$(getent group "$group_name")

    echo "Users in Group $group_name:"
    echo "$users" | tr ',' '\n'
}

get_users_in_group "nginxG"