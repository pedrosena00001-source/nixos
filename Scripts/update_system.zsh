#!/usr/bin/env zsh
#
choice=$(echo -e "Atualizar Sistema\nSwitch" | rofi -dmenu -i)
echo $choice

if [[ "$choice" == "Atualizar Sistema" ]]; then
sudo nix-channel --update
sudo nix flake update --flake ~/nixos-dotfiles/flakes
flatpak update -y
elif [[ "$choice" == "Switch" ]]; then
    kitty -e -c sudo nixos-rebuild switch --flake ~/nixos-dotfiles/flakes#nixos
else
    exit 0
fi
