#!/bin/bash

# This script display various information to the screen.

# Display "Hello"

echo 'Hello'

# Assign a value to a variable.
WORD='script'


echo "$WORD"

# Demontrate that single quotes cause variables to NOT get expanded.
echo '$WORD'

# Combine the variable with hard coded text.
echo "This is a shell $WORD"

# Display the contents of the variable using an alternative syntax.
echo "This is a shell ${WORD}"

# Append text to a variable.
echo "${WORD}ing is fun"

# Show hot NOT to append text to a variable.
# Thid doesn't work!
echo "$WORDing is fun"


# Create a new variable.
ENDING='ed'

# Combine two variables.
echo "This is ${WORD}${ENDING}"

# Change value in ENDING variable
ENDING='ing'
echo "${WORD}${ENDING} is fun!"

# Reassign value to ENDING
ENDING='s'
echo "You are going to write many ${WORD}${ENDING}!"