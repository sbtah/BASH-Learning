#!/bin/bash


read -r -p "What folder should you organize? (fullpath): " path


while read -r line; do
  case "${line}" in
    *.jpg | *.jpeg | *.png)
        if [[ -d 'images' ]]; then
          mv -iv "$line" -t images
        else
          mkdir images
          mv -iv "$line" -t images
        fi
      ;;
    *.doc | *.docx | *.txt | *.pdf)
        if [[ -d 'documents' ]]; then
          mv -iv "$line" -t documents
        else
          mkdir documents
          mv -iv "$line" -t documents
        fi
      ;;
    *.xls | *.xlsx | *.csv)
        if [[ -d 'spreadsheets' ]]; then
          mv -iv "$line" -t spreadsheets
        else
          mkdir spreadsheets
          mv -iv "$line" -t spreadsheets
        fi
      ;;
    *.sh)
        if [[ -d 'scripts' ]]; then
          mv -iv "$line" -t scripts
        else
          mkdir scripts
          mv -iv "$line" -t scripts
        fi
      ;;
    *.zip | *.tar | *.tar.gz | *.tar.bz2)
        if [[ -d 'archives' ]]; then
          mv -iv "$line" -t archives
        else
          mkdir archives
          mv -iv "$line" -t archives
        fi
      ;;
    *.ppt | *.pptx)
        if [[ -d 'presentations' ]]; then
          mv -iv "$line" -t presentations
        else
          mkdir presentations
          mv -iv "$line" -t presentations
        fi
      ;;
    *.mp3)
        if [[ -d 'audio' ]]; then
          mv -iv "$line" -t audio
        else
          mkdir scripts
          mv -iv "$line" -t audio
        fi
      ;;
    *.mp4)
        if [[ -d 'video' ]]; then
          mv -iv "$line" -t video
        else
          mkdir scripts
          mv -iv "$line" -t video
        fi
      ;;
    *)
      ;;
  esac
done < <(ls "$path")
