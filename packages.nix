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
    adwaita-icon-theme
    awww
    curl
    brave
    neovim
    wl-clipboard
    spotify
    btop
    bluez
  ];
}
