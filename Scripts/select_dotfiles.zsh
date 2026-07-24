#!/usr/bin/env zsh
choice=$(echo -e "Nixos-Dotfiles\nScripts\nSystem" | rofi -dmenu)
echo $choice

if [[ "$choice" == "Nixos-Dotfiles" ]]; then kitty -e sh -c 'nvim "$(find ~/nixos-dotfiles -type f | fzf)"'; fi;
if [[ "$choice" == "Scripts" ]]; then kitty -e sh -c 'xdg-open "$(fzf)"'; else kitty -e sh -c 'nvim "$(fd . "/home/pedro" | fzf)"'; fi
