#!/bin/sh

read -p "What is your number? " number

case "${number}" in
  [0-9]) echo "You have entered a single digit number";;
  [0-9][0-9]) echo "You have entered a 2 digits number";;
  [0-9][0-9][0-9]) echo "You have entered a 3 digits number";;
  *) echo "You have entered a number that is more than 3 digits.";;
esac