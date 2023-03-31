#!/bin/bash

# This script shows the open network ports on a system
# Use -4 as an argument to limit to tcpv4 ports.


netstat -nutl -4 | grep -vE '^Active|^Proto' | awk '{print $4}' | awk -F ':' '{print $NF}'
