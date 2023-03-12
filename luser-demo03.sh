#!/bin/bash

# Display the UID and username of the user executing the script.
# Display is the user is the deep user or not.

# 1 Display the UID.
echo "Your UID is ${UID}"

# 2 Only display if the UID does not match 1000.
UID_TO_TEST_FOR='1000'
if [[ "${UID}" -ne ${UID_TO_TEST_FOR} ]]
then
    echo "Your UID does not match ${UID_TO_TEST_FOR}."
    exit 1
fi

# 3 Display the username
USER_NAME=$(id -un)

# 4 Test if the command succeeded
if [[ "${?}" -ne 0 ]]
then
    echo "The id command did not execute successfully."
    exit 1
fi
echo "Your username is ${USER_NAME}"


# 5 You can use a string test conditional
USER_NAME_TO_TEST_FOR='deep'
if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST_FOR}" ]]
then
    echo "Your username matches!"
    exit 0
fi


# 6 Test for not equal for the string.
if [[  "${USER_NAME}" != "${USER_NAME_TO_TEST_FOR}"  ]]
then
    echo "Your username does not match!"
    exit 1
fi

exit 0
