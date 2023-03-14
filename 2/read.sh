#!/bin/bash

read -s -p "What is your name? " NAME
echo
read -s -p "Where do you live? " TOWN
echo
read -s -p "What is your age? " AGE
echo

echo "My name is ${NAME}"
echo "I am ${AGE}"
echo "I live in ${TOWN}"