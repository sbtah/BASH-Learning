#!/bin/bash

# This script generates a random password for each user specified on the command line.

# 1 Display what the user typec on the command line.
echo "You executed this command: ${0}"

# 2 Display the path and filename of the script.
echo "You used $(dirname ${0}) as the path to the $(basename ${0}) script."

# 3 Tell users how many arguments they passed in.
NUMBER_OF_PARAMETERS="${#}"
echo "You supplied ${NUMBER_OF_PARAMETERS} argument(s) on the command line."

# 4 Make sure that at least 1 argument is passed to command line.
if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]]
then
    echo "Usage: ${0} USER_NAME [USER_NAME]..."
    exit 1
fi

# 5 Generate and display a password for each parameter.
for USER_NAME in "${@}"
do
    PASSWORD=$(date +%s%N | sha256sum | head -c 16)
    echo "${USER_NAME}: ${PASSWORD}"
done