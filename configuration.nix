{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix 
      ./packages.nix
      ./home.nix
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos"; 
  nixpkgs.config.allowUnfree = true;
  networking.networkmanager.enable = true;
   networking.networkmanager.dns = "systemd-resolved";
   services.resolved = {
         enable = true;
         dnssec = "false"; # evita falhas de validação com resolvers que não suportam
         fallbackDns = [ "1.1.1.1" "8.8.8.8" ];
};
   
   
   
   
  time.timeZone = "America/Sao_Paulo";
  services.xserver = {
         enable = true;
         autoRepeatDelay = 200;
         autoRepeatInterval = 35;
};
  services.displayManager.ly.enable = true;
  programs.hyprland.enable = true;
  services.xserver.xkb.layout = "br";
  services.xserver.xkb.variant = "abnt2";
  services.xserver.xkb.options = "eurosign:e,caps:escape";
  users.users.pedro = {
    isNormalUser = true;
   extraGroups = [ "wheel" "docker" ]; 
    packages = with pkgs; [
      tree
    ];
  };
  programs.zsh.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.flatpak.enable = true;
  users.users.pedro.shell = pkgs.zsh;
  services.openssh = {
  		enable = true;
		settings.PasswordAuthentication = false;
	};
  system.stateVersion = "26.05";

}

