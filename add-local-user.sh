#!/bin/bash

# Script creates a user on the local system.
# You will be prompted to enter: username, person's full name and a password.
# The username, password and host for the account will be displayed.

if [[ "${UID}" -eq 0 ]]
then
    read -p 'Enter a username to create: ' USER_NAME
    read -p 'Enter a name of the person who is account is for: ' COMMENT
    read -p 'Enter a onetime password for the account: ' PASSWORD
    useradd -c "${COMMENT}" -m ${USER_NAME}
    if [[ "${?}" -eq 0 ]]
        then
            echo "${USER_NAME}:${PASSWORD}" | chpasswd
            if [[ "${?}" -eq 0 ]]
            then
                echo "User with login: ${USER_NAME} and password: ${PASSWORD} was created for host: $(uname -n)"
                passwd -e ${USER_NAME}
                exit 0
            else
                echo "Creation of user failed at chpasswd!"
                exit 1
            fi
        else
            echo 'Creation of user failed!'
            exit 1
        fi
else
    echo 'You are not a superuser. Please run with sudo or as a root.'
    exit 1  
fi
exit 0
