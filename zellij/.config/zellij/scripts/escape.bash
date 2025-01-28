#!/bin/bash


# echo "this ran"

if [ -z $nvim ]; then
   zellij action switch-mode "normal"
   # exit
else
   zellij action switch-mode "locked"
fi

# zellij action close-pane













