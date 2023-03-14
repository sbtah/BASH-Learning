#!/bin/bash

# Simple calculator with positional parameters.
# {1:-0} this is a way to expand parameter with a default value
echo $(( $@ ))
