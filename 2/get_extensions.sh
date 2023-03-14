#!/bin/bash

read -s -p "What is your first name?" FIRST_NAME
echo
read -s -p "What is your family name?" FAMILY_NAME
echo
PS3="What type of phone whould you like to use?: "
select PHONE_TYPE in 'headset' 'handheld'
do
    if [[ -n "${PHONE_TYPE}" ]]
    then
        echo "${PHONE_TYPE} was picked."
        break
    else
        echo "Please pick one of two."
    fi
done
echo
PS3="What is your department?: "
select DEPARTMENT in 'finance' 'sales' 'customer service' 'engineering'
do
    if [[ -n "${DEPARTMENT}" ]]
    then
        echo "${DEPARTMENT} was picked."
        break
    else
        echo "Please pick proper option."
    fi
done
echo
read -N 4 -s -p "What is your extension number?" EXT_NUMBER
echo
read -N 4 -s -p "What is your desired PIN number?" PIN_NUMBER
echo



echo "${FIRST_NAME},${FAMILY_NAME},${EXT_NUMBER},${PIN_NUMBER},${PHONE_TYPE},${DEPARTMENT}" >> extensions.csv
