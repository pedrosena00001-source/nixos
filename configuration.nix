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
  nixpkgs.config.allowUnfree = true;
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "systemd-resolved";
  services.resolved = {
         enable = true;
         dnssec = "false"; 
         fallbackDns = [ "1.1.1.1" "8.8.8.8" ];
};
   hardware.bluetooth = {
  enable = true;
  powerOnBoot = false;
};   
   
   
   
  time.timeZone = "America/Sao_Paulo";
  services.xserver = {
         enable = true;
         autoRepeatDelay = 200;
         autoRepeatInterval = 35;
};
  services.displayManager.ly.enable = true;
  programs.hyprland.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
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
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.zsh.enable = true;
  services.flatpak.enable = true;
  users.users.pedro.shell = pkgs.zsh;
  services.openssh = {
  		enable = true;
		settings.PasswordAuthentication = false;
	};
  system.stateVersion = "26.05";

}

