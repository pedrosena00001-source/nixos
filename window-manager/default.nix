{ config, pkgs, ... }:
{
	imports = [
		./sway.nix
		./waybar.nix
		./quickshell.nix
		./rofi.nix
	];
}
