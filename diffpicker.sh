#!/bin/bash

echo "Please select a file"
options=($(git diff --name-only))

select opt in "${options[@]}" "Quit";
do
  if (( REPLY == 1 + ${#options[@]} ))
  then
    exit
  elif (( REPLY > 0 && REPLY <= ${#options[@]} ))
  then
    echo "$opt" | pbcopy
    break
  else
    echo "Not a valid options. Please try again"
  fi
done
