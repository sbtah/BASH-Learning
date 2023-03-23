#!/bin/bash


date +%s >> performance.log
ping -c 1 google.com &> /dev/null


if [[ "$?" -eq 0 ]]; then
    echo "Interneted connected" >> performance.log
else
    echo "Internet disconected" >> performance.log
fi

echo "RAM Usage: " >> performance.log
free -h | grep "Mem" >> performance.log

echo "Swap Usage: " >> performance.log
free -h | grep "Swap" >> performance.log

echo "Disk Usage: " >> performance.log
df -h >> performance.log
echo "" >> performance.log
