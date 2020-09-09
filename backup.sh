#!/bin/bash

printf "Backup sway config... "
cp ~/.config/sway/* sway/ && echo "done"

printf "Backup waybar config... "
cp ~/.config/waybar/* waybar/ && echo "done"

printf "Backup kitty config... "
cp ~/.config/kitty/* kitty/ && echo "done"

printf "Backup fish config... "
cp -r ~/.config/fish/* fish/ && echo "done"

printf "Backup wofi config... "
cp ~/.config/wofi/* wofi/ && echo "done"

printf "Backup ranger config... "
cp -r ~/.config/ranger/* ranger/ && echo "done"

printf "Backup Atom deps... "
apm list > atom/apm && echo "done"

printf "Backup Atom config... "
cp ~/.atom/config.cson atom/config.cson && echo "done"

printf "Backup newsboat config... "
cp ~/.newsboat/config newsboat/config && echo "done"

printf "Backup newsboat urls... "
cp ~/.newsboat/urls newsboat/urls && echo "done"

printf "Backup bashrc file... "
cp ~/.bashrc shell/bashrc && echo "done"

printf "Backup git config... "
cp ~/.gitconfig git/gitconfig && echo "done"

printf "Backup git ignore... "
cp ~/.gitignore git/gitignore && echo "done"

printf "Backup vimrc file... "
cp ~/.vimrc vim/vimrc && echo "done"

printf "Backup vim color schemes file... "
cp -r ~/.vim/colors vim/ && echo "done"

printf "Backup kernel config file... "
cp -r /usr/src/linux/.config kernel/config && echo "done"

printf "Backup fstab file... "
cp -r /etc/fstab etc/fstab && echo "done"

printf "Backup fstab file... "
cp -r /etc/fstab etc/fstab && echo "done"

printf "Backup world file... "
cp -r /var/lib/portage/world gentoo/world && echo "done"

printf "Backup make.conf file... "
cp -r /etc/portage/make.conf etc/make.conf && echo "done"

printf "Backup grub default file... "
cp -r /etc/default/grub etc/grub && echo "done"
