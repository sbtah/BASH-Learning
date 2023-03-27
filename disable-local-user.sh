#!/bin/bash


delete=false
remove_home=false
create_archive=false
readonly archive_directory='/archive'

usage() {
  echo "Usage: ${0} [-dra] USER ... " 1>&2
  echo 'Disable specified user(s).' 1>&2
  echo '-d Deletes account(s) instead of disabling them.' 1>&2
  echo '-r Removes the home directory for specified account(s).' 1>&2
  echo '-a Creates an archive of home directory for specified account(s).' 1>&2
  exit 1
}


archive_user_home() {
  archive_file="$1-home-$(date +%s).tar.gz"
  if [[ -d "${archive_directory}" ]]; then
    tar -czvf "$archive_file" "/home/${1}/"
    mv "${archive_file}" "${archive_directory}"
  else
    if [[ $(mkdir -p archive) -eq 0 ]]; then
      tar -czf "$archive_file" "/home/${1}/" &> /dev/null
      mv "${archive_file}" "${archive_directory}/${archive_file}"
    else
      echo "The archive directory could not be created." 1>&2
      exit 1
    fi
  fi
}


delete_user() {
  user_id=$(id -u "${1}")
  if [[ $user_id -ge 1000 ]]; then
    if [[ $remove_home = true && $create_archive = true ]]; then
      userdel -r "${1}"
      archive_user_home "${1}"
    elif [[ $remove_home = true && $create_archive = false ]]; then
      userdel -r "${1}"
    elif [[ $remove_home = false && $create_archive = true ]]; then
      userdel "${1}"
      archive_user_home "${1}"
    else
      userdel "${1}"
    fi
  else
    echo "Sorry you can't delete system account of UID: ${user_id}" 1>&2
    return 1
  fi
}


disable_user() {
  user_id=$(id -u "${1}")
  if [[ $user_id -ge 1000 ]]; then
    if [[ $remove_home = true && $create_archive = true ]]; then
      chage -E 0 "${1}"
      archive_user_home "${1}"
      rm -rf "/home/$1"
    elif [[ $remove_home = true && $create_archive = false ]]; then
      chage -E 0 "${1}"
      rm -rf "/home/$1"
    elif [[ $remove_home = false && $create_archive = true ]]; then
      chage -E 0 "${1}"
      archive_user_home "${1}"
    else
      chage -E 0 "${1}"
    fi
  else
    echo "Sorry you can't delete system account of UID: ${user_id}" 1>&2
    return 1
  fi
}


if [[ "${UID}" -ne 0 ]]; then
  echo "To use this script you need administrator privileges." 1>&2
  exit 1
fi

if [[ "${#}" -eq 0 ]]; then
  usage
fi

while getopts dra option; do
  case "$option" in
    d)
      delete=true
      shift "$(( OPTIND - 1 ))"
      ;;
    r)
      remove_home=true
      shift "$(( OPTIND - 1 ))"
      ;;
    a)
      create_archive=true
      shift "$(( OPTIND - 1 ))"
      ;;
    \?)
      usage
      ;;
  esac
done

for user in "${@}"; do
  echo "Processing user: ${user}"
  if [[ $delete = true ]]; then
    delete_user "${user}"
  else
    disable_user "${user}"
  fi
done