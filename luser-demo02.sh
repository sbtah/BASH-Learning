#!/bin/bash

# Display they UID and username of the user executing the script.
# Display if the user is root or not

# 1 Display the UID
echo "Your UID is: ${UID}"

# 2 Display the USERNAME
USER_NAME=$(id -un)
# OLD SYNTAX:
# USER_NAME=`id -un`
echo "Your username is: ${USER_NAME}"

# 3 Display if the user is the root or not.
if [[ "${UID}" -eq 0 ]]
then 
    echo "You are root!"
else
    echo "You are not root!"
fi