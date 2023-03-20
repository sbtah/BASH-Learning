#!/bin/bash

readarray -t urls < urls.txt


for url in "${urls[@]}"; do
  curl --head "${url}" > "$(echo "$url" | cut -d "." -f 2)"
done
