#!/bin/bash

status=$(acpi | grep -oP "Charging|Discharging")

check=$(cat ~/.config/i3blocks/battery_status.txt)

if [[ "$status" == "Charging" && "$check" == "Discharging" ]]; then
  dunstify -r 9995 "Battery Status" "Charging"
elif [[ "$status" == "Discharging" && "$check" == "Charging" ]]; then
  dunstify -r 9995 "Battery Status" "Discharging"
fi

echo "$status" > ~/.config/i3blocks/battery_status.txt

time=$(acpi | grep -oP "\d{2}:\d{2}:\d{2}")
time="${time%???}"


if [[ "$status" == "Charging" ]]; then 
  status="C"
else
  status="D"
fi

status_code="#1616d1"

if [[ "$status" == "D" ]]; then
  status_code="#e7ea12"
fi

echo "($status $time)"
echo "($status $time)"
echo "$status_code"



