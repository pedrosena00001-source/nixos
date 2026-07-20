{ config, pkgs, ... }:

{
    home.username = "pedro";
    home.homeDirectory = "/home/pedro";
    home.stateVersion = "25.05";
    imports = [
       ./zsh.nix
       ./neovim
	./window-manager
    ];
    programs.zsh = {
      enable = true;
    };
    home.file.".config/kitty/kitty.conf".source = ./kitty/kitty.conf;   

}
