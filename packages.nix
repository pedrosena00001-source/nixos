{ config, lib, pkgs, ... }:
{
environment.systemPackages = with pkgs; [
    vim 
    wget
    git
    librewolf
    kitty
    rofi
    fastfetch
    docker
    gh
    hyprpaper
    adwaita-icon-theme
    awww
    curl
    brave
    waybar
  ];
}
