{ config, pkgs, ... }:
{
   let
       home-manager = builtins.fetchTarball ""https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
       in;
 {
   imports = [
        (import "${home-manager}/nixos");
   ];
   

   home-manager.useUsersPackages = true;
   home-manager.useGlobalPackages = true; 
   home-manager.backupFileExtension = "backup";

{
   home.username = "pedro";
   home.homeDirectory = "/home/pedro";
   home.stateVersion = "25.05";
   

   programs.zsh = {
       enable = true;
      };
   };
}

