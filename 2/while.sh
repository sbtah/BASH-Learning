#!/bin/bash

read -p "Enter your number: " num

while [[ $num -ge 10 ]]; do
  echo "$num"
  num=$(( $num - 1 ))
done