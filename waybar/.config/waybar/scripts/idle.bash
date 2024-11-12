#!/bin/bash

check=$(pgrep swayidle)


if [[ $check == "" ]]; then 
  echo "{\"text\":\" \"}"
else 
  echo "{\"text\":\"󰒲 \"}"
fi 

