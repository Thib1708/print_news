#!/bin/zsh

color=0;
while [ $color -lt 255 ]; do
    echo -e "$color: \\033[38;5;${color}mhello\\033[48;5;${color}mworld\\033[0m"
    ((color++));
done
