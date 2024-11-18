#!/usr/bin/env bash

command="tmux display-message -p \"#{pane_at_${1}}\""
output=$(eval "$command")

if [[ $output == "1" ]]; then
  exit
fi

if [[ $1 == "top" ]]; then
  tmux select-pane -U

elif [[ $1 == "bottom" ]]; then
  tmux select-pane -D

elif [[ $1 == "left" ]]; then
  tmux select-pane -L

elif [[ $1 == "right" ]]; then
  tmux select-pane -R

fi
