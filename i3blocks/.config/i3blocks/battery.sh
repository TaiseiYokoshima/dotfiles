#!/bin/bash

# ./battery_init.sh

status=$(acpi | grep -oP "Charging|Discharging")

check=$(cat ~/.config/i3blocks/battery_status.txt)

if [[ "$status" == "Charging" && "$check" == "Discharging" ]]; then
  dunstify -r 9995 "Battery Status" "Charging"
  echo "$status" > ~/.config/i3blocks/battery_status.txt
elif [[ "$status" == "Discharging" && "$check" == "Charging" ]]; then
  dunstify -r 9995 "Battery Status" "Discharging"
  echo "$status" > ~/.config/i3blocks/battery_status.txt
fi


level=$(acpi | grep -oP "\d{1,3}%")
level="${level%?}"
time=$(acpi | grep -oP "\d{2}:\d{2}:\d{2}")
time="${time%???}"


last_level=$(cat ~/.config/i3blocks/battery_level.txt)


factor=$(echo "$(( (last_level / 10) * 10 ))")



# factor="60"
# level="60"



if [ "$factor" -ge "$level" ]; then
  if [ "30" -ge "$factor" ]; then
    dunstify -u critical "Battery Level" "${level}%"
  else
    dunstify "Battery Level" "${level}%"
  fi

fi



echo "$level" > ~/.config/i3blocks/battery_level.txt



if [[ "$status" == "Charging" ]]; then 
  status="C"
else
  status="D"
fi

battery_code="32"


if [ "30" -ge "$level" ]; then 
 battery_code="31"
elif [ "50" -ge "$level" ]; then
 battery_code="38;5;208"
fi

status_code="36"

if [[ "$status" == "D" ]]; then
  status_code="33"
fi


echo "${level}%" 
echo "${level}%" 
echo "#55ff33" 


echo " ($status $time)"
echo " ($status $time)"
echo "#d52819"

# output="\033[${battery_code}m${level}%\033[0m  \033[${status_code}m($status $time)\033[0m"


echo -e "$output"



exit

