#!/usr/bin/env zsh
#
sudo nix-channel --update
sudo nix flake update --flake ~/nixos-dotfiles/flakes
flatpak update -y
echo "Sistema Atualizado"
