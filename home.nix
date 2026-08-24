{ inputs, config, pkgs, ... }:

{
    home.username = "pedro";
    home.homeDirectory = "/home/pedro";
    home.stateVersion = "25.05";
    imports = [
	inputs.nvf.homeManagerModules.nvf
        inputs.nix-doom-emacs-unstraightened.homeModule
       ./terminal
       ./neovim
	./window-manager
    ];
    programs.zsh = {
      enable = true;
    };

        programs.doom-emacs = {
                enable = true;
                doomDir = ./doom.d;
        };
        services.emacs.enable = true;
        home.packages = with pkgs; [
                nil
        ];
    home.file.".config/kitty/kitty.conf".source = ./kitty/kitty.conf;   

}
