{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix 
      ./packages.nix
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;
  networking.nameservers = [
            "1.1.1.1"
            "1.0.0.1"
            "8.8.8.8"
            "8.8.4.4"
   ];
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

