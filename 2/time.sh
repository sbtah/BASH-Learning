#!/bin/bash


while getopts "m:s:" opt; do
    if [[ "${opt}" = 'm' ]]; then
      seconds_from_minutes=$(echo $(($OPTARG * 60)) | bc)
    fi
    if [[ "${opt}" = 's' ]]; then
      seconds=$OPTARG
    fi
done

total_seconds=$(( $seconds_from_minutes + $seconds ))

while [[ $total_seconds -gt 0 ]]; do
    echo "$total_seconds"
    total_seconds=$(( $total_seconds - 1))
    sleep 1s
done