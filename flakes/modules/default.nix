{ config, lib, pkgs, inputs, ... }:
{
  flake.modules.nixos.hyprland = { pkgs, ...}: {
    imports = [inputs.hyprland.nixosModules.default];
    programs.hyprland.enable = true;
  };
  flake.modules.homeManager.hyprland = {config, pkgs, lib, ...}: {
    xdg.configFile."hypr/hyprland.lua".source = ./hypr/hyprland.lua;
  };
}
