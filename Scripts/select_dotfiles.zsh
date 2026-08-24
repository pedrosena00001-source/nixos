#!/usr/bin/env zsh

choice=$(echo -e "Nixos-Dotfiles\nSystem" | rofi -dmenu)
echo $choice

if [[ "$choice" == "Nixos-Dotfiles" ]]; then
    kitty -e sh -c 'emacs "$(find ~/nixos-dotfiles -type f | fzf)"' & pkill kitty
elif [[ "$choice" == "System" ]]; then
    kitty -e sh -c 'emacs "$(fd . "/home/pedro" | fzf)"' & pkill kitty
else
    exit 0
fi
