#!/bin/bash

PS3="Which script would you like to run?: "

select script in 'cruft_remover' 'folder_organiser'; do
  case "$script" in
    'cruft_remover')
      ./cruft_remover.sh
      ;;
    'folder_organiser')
      ./folder_organiser.sh
      ;;
    *)
      ;;
  esac
done
