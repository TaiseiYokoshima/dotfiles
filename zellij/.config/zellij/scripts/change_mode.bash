#!/bin/bash



if [ ! -n $nvim ]; then

   zellij action write-chars " no vim"
   zellij action switch-mode normal
   exit
fi


zellij action write-chars "yes vim"
zellij action switch-mode locked


