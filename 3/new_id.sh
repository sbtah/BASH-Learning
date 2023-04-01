#!/bin/bash


# This script generates new machine-id and reboots the system.

if [[ "${UID}" -ne '0' ]]; then
  echo 'You need to run this as a root!' 1>&2
  exit 1
else
  current_id=$(cat /var/lib/dbus/machine-id)
  new_id="$(date +%s%N | sha256sum | head -c 32)"
  echo 'Your current id: '
  echo "${current_id}"
  echo "${new_id}" > /var/lib/dbus/machine-id
  echo
  id_now=$(cat /var/lib/dbus/machine-id)
  echo 'Your new id: '
  echo "${id_now}"
fi