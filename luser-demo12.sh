#!/bin/bash


# This script deletes a user.


# Check if script is run as a root.
if [[ "${UID}" -eq 0 ]]; then
  if [[ "${#}" -eq 1 ]]; then
    user_to_delete="${1}"
    userdel "${user_to_delete}"
    if [[ "${?}" -ne 0 ]]; then
      echo "The account ${user_to_delete} was NOT deleted!" 1>&2
      exit 1
    else
      echo "The account ${user_to_delete} was DELETED."
      exit 0
    fi
  else
    echo "Wrong number of arguments. Please specify just 1 username to delete" 1>&2
    exit 1
  fi 
else
  echo "This script have to be run as an administrator." 1>&2
  exit 1
fi