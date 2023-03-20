#!/bin/bash

readarray -t urls < urls.txt


for url in "${urls[@]}"; do
  echo $(curl --head "${url}") > $(cut -d "." -f 2 < <(echo "$url"))".txt"
done
