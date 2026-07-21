{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix 
      ./packages.nix
	./fonts.nix
   ];

  #Dar Boot Em Sistema UEFI
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #Configurações De Host e Usuário
  networking.hostName = "nixos"; 
  nixpkgs.config.allowUnfree = true;

  users.users.pedro = {
    isNormalUser = true;
   extraGroups = [ "wheel" "docker" ]; 
    packages = with pkgs; [
      tree
    ];
  };

  #Configurações Da Wifi wireless
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

  #Programas Gerenciados Pelo Configuration
  programs.hyprland.enable = true;
  programs.sway.enable = true;
  services.flatpak.enable = true;
  services.displayManager.ly.enable = true;
  programs.zsh.enable = true;
  users.users.pedro.shell = pkgs.zsh;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #Kernel Do Sistema
  boot.kernelPackages = pkgs.linuxPackages_zen;

  services.xserver.xkb.layout = "br";
  services.xserver.xkb.variant = "abnt2";
  services.xserver.xkb.options = "eurosign:e,caps:escape";

  services.openssh = {
  		enable = true;
		settings.PasswordAuthentication = false;
	};

  #Firewall Da Config Do NixOs
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  networking.firewall.allowedUDPPortRanges = [
  { from = 4000; to = 4007; }
  { from = 8000; to = 8010; }
];
  system.stateVersion = "26.05";

}

