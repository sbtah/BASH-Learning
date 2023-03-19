#!/bin/bash

# line is a variable we are storing line data in.
while read line; do
  echo "$line"
done < <(ls $HOME)