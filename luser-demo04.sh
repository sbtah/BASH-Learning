#!/bin/bash

# This script creates an account on local system.
# You will be prompted for the account name and password.


# 1 Ask for the user name.
read -p 'Enter the username to create: ' USER_NAME

# 2 Ask for the real name.
read -p 'Enter the name of the person who this account is for: ' COMMENT

# 3 Ask for the password.
read -p 'Enter the password to use for the account: ' PASSWORD

# 4 Create the user.
useradd -c "${COMMENT}" -m ${USER_NAME}

# 5 Set the password for the user.
echo "${USER_NAME}:${PASSWORD}" | chpasswd

# 6 Force password change on the first login.
passwd -e ${USER_NAME}