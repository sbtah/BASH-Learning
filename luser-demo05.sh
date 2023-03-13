#!/bin/bash

# This scripts generates a list of random passwords.

# A random number as a password.
PASSWORD="${RANDOM}"
#echo "${PASSWORD}"

# Three random numbers together
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
#echo "${PASSWORD}"

# Use the current date/time as the basis for the password.
PASSWORD=$(date +%s)
#echo "${PASSWORD}"

# Use nanoseconds to act as randomization.
PASSWORD=$(date +%s%N)
#echo "${PASSWORD}"

# A better password.
PASSWORD=$( date +%s%N | sha256sum | head -c 32)
#echo "${PASSWORD}"

# An even better password.
PASSWORD=$( date +%s%N${RANDOM}${RANDOM}${RANDOM} | sha256sum | head -c 16)
#echo "${PASSWORD}"

# Append a special character to a password
SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+-=' | fold -w 1 | shuf | head -c 1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"