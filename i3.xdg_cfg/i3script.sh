#!/bin/bash

# Custom shell script to add features to i3status

# Add Keyboard Layout indicator
# For more than 3 layouts, use `xkblayout-state`:
# https://github.com/nonpop/xkblayout-state

i3status -c ${HOME}/.config/i3status/config | while :
do
  read line

  # check that `xkblayout-state` is installed
  if hash xkblayout-state 2>/dev/null; then

    LG=$( xkblayout-state print %s )
    case ${LG} in
      "gb")
        dat="[{ \"full_text\": \"GB\", \"color\":\"#FF6600\" },"
        ;;
      "bg")
        dat="[{ \"full_text\": \"BG\", \"color\":\"#CC00FF\" },"
        ;;
      "de")
        dat="[{ \"full_text\": \"DE\", \"color\":\"#458B00\" },"
        ;;
      *)
        dat="[{ \"full_text\": \"GB\", \"color\":\"#FF6600\" },"
        ;;
    esac

  else

    LG=$( xset -q | grep LED | awk '{ print $10 }' )
    case ${LG} in
      "00000000")
        dat="[{ \"full_text\": \"GB\", \"color\":\"#FF6600\" },"
        ;;
      "00001000")
        dat="[{ \"full_text\": \"BG\", \"color\":\"#CC00FF\" },"
        ;;
    esac

  fi

  echo "${line/[/${dat}}" || exit 1
done
