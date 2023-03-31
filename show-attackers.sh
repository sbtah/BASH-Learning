#!/bin/bash

# grep 'Failed' access_log | awk '{print $(NF - 3)}' | sort | uniq -c | sort -nr


readonly limit_failures='10'
log_file="${1}"


if [[ "${#}" -lt 1 || "${#}" -gt 1 ]]; then
  echo "This script takes only 1 argument: logfile." 1>&2
  exit 1
else
  if [[ ! -e "${log_file}" ]]; then
    echo 'Specified logfile does not exists!' 1>&2
    exit 1
  else
  echo 'Count,IP,Location' > rapport.csv
  grep 'Failed' "${1}" | awk '{print $(NF - 3)}' | sort | uniq -c | sort -nr | while read -r count ip; do
    if [[ "${count}" -gt "${limit_failures}" ]]; then
      location=$(geoiplookup "${ip}" | awk -F ', ' '{print $2}')
      echo "${count},${ip},${location}"
    fi 
  done >> rapport.csv
  fi
fi