#!/bin/bash

read -s -p "What is your first name?" FIRST_NAME
echo
read -s -p "What is your family name?" FAMILY_NAME
echo
read -N 4 -s -p "What is your extension number?" EXT_NUMBER
echo
read -N 4 -s -p "What is your desired PIN number?" PIN_NUMBER
echo

echo "${FIRST_NAME},${FAMILY_NAME},${EXT_NUMBER},${PIN_NUMBER}" >> extensions.csv
