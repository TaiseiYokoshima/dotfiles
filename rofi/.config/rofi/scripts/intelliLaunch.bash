#!/bin/bash

get_window_id() {
  # get tree
  tree=$(swaymsg -t get_tree)

  # find focused and its line number
  line=$(echo "$tree" | grep -n 'focused": true' | sed -e "s/:/ /g" | awk '{print $1}')

  # minux 6 to get to the line with window id
  line="$line - 6"
  line=$(expr $line)

  #extract the id
  id=$(echo "$tree" | sed -n "${line}p" | awk '{print $2}' | sed -e "s/,//g")
  echo $id
}

text=$(swaymsg -t get_workspaces --pretty)
monitor_line=$(echo "$text" | grep -n focused | sed -e "s/:/ /g" )
monitor_line="$(echo $monitor_line | awk '{print $1}') + 1"
monitor_line=$(expr $monitor_line)
monitor=$(echo "$text" | sed -n "${monitor_line}p" | awk '{print $2}')



window_id=$(get_window_id)

rofi -show drun -steal-focus -replace -m "$monitor" &


while true; do 
 check=$(get_window_id)
 if [[ "$check" !=  "$window_id" ]]; then 
   pkill rofi && exit
 fi

 if [[ -z  "$(pgrep rofi)" ]]; then 
   exit
 fi
done







