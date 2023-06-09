#!/bin/bash

# Script creates a user on the local system.
# You will be prompted to enter: username, person's full name and a password.
# The username, password and host for the account will be displayed.

if [[ "${UID}" -eq 0 ]]
then
    if [[ "${#}" -gt 0 ]]
    then
    USER_NAME="${1}"
    shift
    COMMENT="$@"
    PASSWORD=$( date +%s%N${RANDOM}${RANDOM}${RANDOM} | sha256sum | head -c 16)
    useradd -c "${COMMENT}" -m "${USER_NAME}" &> /dev/null
        if [[ "${?}" -eq 0 ]]
            then
                echo "${USER_NAME}:${PASSWORD}" | chpasswd &> /dev/null
                if [[ "${?}" -eq 0 ]]
                then
                    echo "User with login: ${USER_NAME} and password: ${PASSWORD} was created for host: $(uname -n)"
                    passwd -e "${USER_NAME}" &> /dev/null
                    exit 0
                else
                    echo "Creation of user failed at chpasswd!" 1>&2
                    exit 1
                fi
            else
                echo 'Creation of user failed!' 1>&2
                exit 1
            fi
    else
        echo "Usage: ${0} USER_NAME [FULL_NAME]" 1>&2
        exit 1
    fi
else
    echo 'You are not a superuser. Please run with sudo or as a root.' 1>&2
    exit 1  
fi
exit 0
