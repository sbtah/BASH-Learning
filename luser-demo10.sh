#!/bin/bash



readonly verbose=true


log() {
    # This function sends message to STDOUT if verbose is set to true.
    local message="$*"
    if [[ "${verbose}" = true ]]; then
        echo "${message}"
    fi
}

backup() {
    # This function creates a backup of a file.
    # Returns non-zero status on error.
    local file
    file="${1}"
    # Make sure the file exists.
    if [[ -f "$file" ]]; then
        local backup_file
        backup_file="/tmp/$(basename "${file}").$(date +%F-%N)"
        log "Backing up ${file} to ${backup_file}"
        # The exit status of the function will be the exit status of the cp command.
        cp -p "${file}" "${backup_file}"
    else
        # The file does not exist, so return non-zero exit status.
        return 1
    fi
}

backup '/etc/passwd'

if [[ "${?}" -eq 0 ]]; then
    log 'File backup succeeded!'
else
    log 'File backup failed!'
    exit 1
fi