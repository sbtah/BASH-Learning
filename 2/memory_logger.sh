#!/bin/bash


backup_dir="${HOME}/performance"


if [[ -d $backup_dir ]]; then
  echo "Performance directory exists!"
  free >> $backup_dir/memory.log
else
    mkdir -p $backup_dir
    if [[ $? = 0 ]]; then
        echo "Needed directory created!"
        free >> $backup_dir/memory.log
    else
        echo "Failed at creating needed directory!"
    fi
fi