#!/bin/bash


read -r -p "What directory would you like to clean (fullpath): " directory
echo
read -r -p "How many days file have to be unmodified to get deleted?: " days
echo


readarray -t files < <(find "${directory}" -maxdepth 1 -type f -mtime "${days}")


for file in "${files[@]}"; do
	rm -i "$file"
done