#!/usr/bin/env bash
tmux_layout=$(tmux showw -v @layout)


if [[ $tmux_layout == "vertical" ]]; then 
  tmux select-layout even-horizontal
  tmux_layout="horizontal"
elif [[ $tmux_layout == "horizontal" ]]; then 
  tmux select-layout even-vertical
  tmux_layout="vertical"
elif [[ $tmux_layout == "" ]]; then 
  tmux select-layout even-vertical
  tmux_layout="vertical"
else  
  tmux select-layout even-vertical
  tmux_layout="vertical"
fi


tmux setw @layout "$tmux_layout"



