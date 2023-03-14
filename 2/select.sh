#!/bin/bash

PS3="What is the day of the week?: "

select DAY in 'MON' 'TUE' 'WED' 'THU' 'FRI' 'SAT' 'SUN';
do
    if [[ -n "${DAY}" ]]
    then
        echo "The day of the week is ${DAY}"
        break
    else
        echo "No answer passed, please pick a day..."
    fi
done