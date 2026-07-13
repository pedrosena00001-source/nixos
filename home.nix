{ config, pkgs, ... }:

{
    imports = [
	 ./zsh.nix
       ];
    home.username = "pedro";
    home.homeDirectory = "/home/pedro";
    home.stateVersion = "25.05";
    programs.zsh = {
            enable = true;
         };
    home.file.".config/kitty/kitty.conf".source = ./kitty/kitty.conf;   
} 
 
   
   
   
   
   
   
   
   
   

   
   
   
   
   
   
   
   
   
   
   
   
   

   
   
   
   
   
