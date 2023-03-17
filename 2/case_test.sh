#!/bin/bash


PS3="What city would you like to visit?: "


select city in 'Tokyo' 'London' 'Los Angeles' 'Moscow' 'Dubai' 'Manchester' 'New York' 'Paris' 'Istanbul' 'Milan' 'Abu Dhabi' 'Pune' 'Nairobi' 'Berlin' 'Karachi'
do
  case "${city}" in
  'Tokyo') echo "You picked a trip to Japan, Great choice!";;
  'London'|'Manchester') echo "You picked a trip to England, Great choice!";;
  'Los Angeles'|'New York') echo "You picked a trip to USA, Great choice!";;
  'Moscow') echo "You picked a trip to Russia, Great choice!";;
  'Dubai'|'Abu Dhabi') echo "You picked a trip to United Arab Emirates, Great choice!";;
  'Paris') echo "You picked a trip to France, Great choice!";;
  'Istanbul') echo "You picked a trip to Turkey, Great choice!";;
  'Milan') echo "You picked a trip to Italy, Great choice!";;
  'Pune') echo "You picked a trip to India, Great choice!";;
  'Nairobi') echo "You picked a trip to Kenya, Great choice!";;
  'Berlin') echo "You picked a trip to Germany, Great choice!";;
  'Karachi') echo "You picked a trip to Pakistan, Great choice!";;
  esac
  break
done
