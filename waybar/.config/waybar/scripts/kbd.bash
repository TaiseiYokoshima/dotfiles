#!/bin/bash

check=$(/usr/bin/fcitx5-remote)

if [[ $check == "2" ]]; then
  echo "{\"text\":\" JP\"}"
else 
  echo "{\"text\":\"US\"}"
fi

