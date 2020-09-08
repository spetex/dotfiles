#!/bin/bash

printf "Backup sway config... "
cp ~/.config/sway/* sway/ && echo "done"

printf "Backup waybar config... "
cp ~/.config/waybar/* waybar/ && echo "done"

printf "Backup kitty config... "
cp ~/.config/kitty/* kitty/ && echo "done"
