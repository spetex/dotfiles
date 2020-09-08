#!/bin/bash

printf "Backup sway config... "
cp ~/.config/sway/* sway/ && echo "done"

printf "Backup waybar config... "
cp ~/.config/waybar/* waybar/ && echo "done"

printf "Backup kitty config... "
cp ~/.config/kitty/* kitty/ && echo "done"

printf "Backup git config... "
cp ~/.gitconfig git/gitconfig && echo "done"

printf "Backup git ignore... "
cp ~/.gitignore git/gitignore && echo "done"

printf "Backup vimrc file... "
cp ~/.vimrc vim/vimrc && echo "done"

printf "Backup vim color schemes file... "
cp -r ~/.vim/colors vim/ && echo "done"
