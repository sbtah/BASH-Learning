#!/bin/bash

# This script generates a random password
# User can set the password length with -l and add a special character with -s
# Verbose mode can be enabled with -v.

# Set a default password length.
length=18

log() {
    local message
    message="$*"
    if [[ "${verbose}" = true ]]; then
        echo "${message}"
    fi
}

usage() {
    echo "Usage: ${0} [-vs] [-l LENGTH]" 1>&2
    echo 'Generates a random password.'
    echo '-l LENGTH Specify the password length.'
    echo '-s        Append a special character to the password.'
    echo '-v        Increase verbosity.'
    exit 1
}

while getopts l:sv option; do
    case "$option" in
        v)
            verbose=true
            log 'Verbose mode on.'
            ;;
        l)
            length="${OPTARG}"
            ;;
        s)
            use_special_char=true
            ;;
        \?)
            usage
            ;;
    esac
done

# Remove the options while leaving the remaining arguments.
shift "$(( OPTIND - 1 ))"

if [[ "${#}" -gt 0 ]]; then
    usage
fi

log 'Generating a password!'

password=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c"${length}")

# Append a special character if requested to do so.
if [[ "${use_special_char}" = true ]]; then
    log 'Selecting a random special character.'
    special_char=$(echo '!@#$%^&*()_+-=' | fold -w1 | shuf | head -c1)
    password="${password}""${special_char}"
fi

log 'Done'
log 'Here is the password: '
echo "${password}"

exit 0