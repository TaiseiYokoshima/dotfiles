#!/bin/bash


level=$(acpi | grep -oP "\d{1,3}%")
level="${level%?}"


last_level=$(cat ~/.config/i3blocks/battery_level.txt)


factor=$(echo "$(( (last_level / 10) * 10 ))")




if [ "$factor" -gt "$level" ]; then
  if [ "30" -ge "$factor" ]; then
    dunstify -u critical "Battery Level" "${level}%"
  else
    dunstify "Battery Level" "${level}%"
  fi

fi

echo "$level" > ~/.config/i3blocks/battery_level.txt


battery_code="#20fb02"


if [ "30" -gt "$level" ]; then 
 battery_code="#f11e14"
elif [ "50" -gt "$level" ]; then
 battery_code="#fb7e02"
fi

echo "${level}%" 
echo "${level}%" 
echo "$battery_code" 



