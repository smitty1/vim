#!/bin/bash
My_Shell="csh"


if [ "$My_Shell" = "bash" ];
  then 
    echo "You seem to like the Bash shell"
elif [ "$My_Shell" = "zsh" ];
  then
    echo "You seem to like the zsh shell"
  else
    echo "You don't seem to like the Bash or zsh shells"
fi

