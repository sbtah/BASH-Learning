#!/bin/bash


read X
read Y

if [[ X -eq Y ]]; then
    echo "X is equal to Y"
elif [[ X -lt Y ]]; then
    echo "X is less than Y"
elif [[ X -gt Y ]]; then
    echo "X is greater than Y"
fi
