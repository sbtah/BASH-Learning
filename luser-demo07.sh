#!/bin/bash

# Demonstrante the use of shift and while loops.
# 1 Display the first three parameters

# echo "Parameter 1: ${1}"
# echo "Parameter 2: ${2}"
# echo "Parameter 3: ${3}"
# echo

# 2 Loop through all the positional parameters.
while [[ "${#}" -gt 0 ]]
do
    echo "Number of parameters: ${#}"
    echo "Parameter 1: ${1}"
    echo "Parameter 2: ${2}"
    echo "Parameter 3: ${3}"
    echo
    shift
done