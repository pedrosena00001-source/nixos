#!/usr/bin/env zsh
choice=$(echo -e "Nixos-Dotfiles\nSystem" | rofi -dmenu -i)
echo $choice

if [[ "$choice" == "Nixos-Dotfiles" ]]; then
    kitty -e sh -c 'nvim "$(find ~/nixos-dotfiles -type f | fzf)"'
elif [[ "$choice" == "System" ]]; then
    kitty -e sh -c 'nvim "$(fd . "/home/pedro" | fzf)"'
else
    exit 0
fi
