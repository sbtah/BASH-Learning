#!/bin/bash


PS3="What city would you like to visit?: "


select city in 'Tokyo' 'London' 'Los Angeles' 'Moscow' 'Dubai' 'Manchester' 'New York' 'Paris' 'Istanbul' 'Milan' 'Abu Dhabi' 'Pune' 'Nairobi' 'Berlin' 'Karachi'; do
  case "${city}" in
    'Tokyo')
      country='Japan'
      ;;
    'London'|'Manchester')
      country='England'
      ;;
    'Los Angeles'|'New York')
      country='USA'
      ;;
    'Moscow')
      country='Russia'
      ;;
    'Dubai'|'Abu Dhabi')
      country='United Arab Emirates'
      ;;    
    'Paris')
      country='France'
      ;;
    'Istanbul')
      country='Turkey'
      ;;
    'Milan')
      country='Italy'
      ;;
    'Pune')
      country='India'
      ;;
    'Nairobi')
      country='Kenya'
      ;;
    'Berlin')
      country='Germany'
      ;;
    'Karachi')
      country='Pakistan'
      ;;
  esac
    echo "You picked a trip to ${country}, Great choice!"
done
