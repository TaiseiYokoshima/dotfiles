#!/bin/bash

level=$(acpi | grep -oP "\d{1,3}%")
level="${level%?}"
state=$(acpi | grep -oP "Discharging|Charging")

echo "$level" > ~/.config/i3blocks/battery_level.txt
echo "$state" > ~/.config/i3blocks/battery_status.txt





