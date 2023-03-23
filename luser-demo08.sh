#!/bin/bash


# This script demonstrates I/O redirection


# Redirect STDOUT to a file
file="data"

head -n1 /etc/passwd > ${file}


# Redirect STDIN to a program.
read -r line < "$file"
echo "line contains: ${line}"


# Redirect STDOUT to a file, overwiting the file.
head -n3 /etc/passwd > ${file}
echo
echo "Contents of ${file}: "
cat $file


# Redirect STDOUT to a file, appending to the file.
echo "${RANDOM} ${RANDOM}" >> $file
echo "${RANDOM} ${RANDOM}" >> $file
echo
echo "Contents of ${file}: "
cat $file


# Redirect STDIN to a program, using FD 0
read -r line 0< $file
echo
echo "Line contains: ${line}"

# Redirect STDOUT to a file using FD 1, while overwriting file content.
head -n3 /etc/passwd 1> $file
echo
echo "Contents of ${file}: "
cat $file

# Redirect STDERR to a file using FD 2.
err_file="data.err"
head -n3 /etc/password /fakefile 2> $err_file

# Redirect STDOUT and STDERR to a file.
head -n3 /etc/passwd /fakefile &> $file

# Redirect STDOUT and STDERR through a pipe.
head -n3 /etc/passwd /fakefile |& cat -n


# Redirect STDOUT to STDERR,
# ... used for cases in script where you want to communicate certain message as error.
echo "This is an error message" 1>&2


# Discard STDOUT
echo "Discarding STDOUT" 1> /dev/null


# Discard STDERR
echo "Discarding STDERR" 2> /dev/null

# Discard both STDOUT and STDERR
echo "Discarding STDOUT and STDERR" &> /dev/null
rm $file $err_file &> /dev/null