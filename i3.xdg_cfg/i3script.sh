#!/bin/bash

# Custom shell script to add features to i3status

i3status -c ${HOME}/.config/i3status/config | while :
do
  read line
  LG=$( xset -q | grep LED | awk '{ print $10 }' )
  case ${LG} in
    "00000000")
      dat="[{ \"full_text\": \"GB\", \"color\":\"#FF6600\" },"
      ;;
    "00001000")
      dat="[{ \"full_text\": \"BG\", \"color\":\"#CC00FF\" },"
      ;;
  esac
  echo "${line/[/${dat}}" || exit 1
done
