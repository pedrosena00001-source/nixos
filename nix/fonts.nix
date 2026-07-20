{ config, pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.envy-code-r
      noto-fonts-emoji     
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "EnvyCodeR Nerd Font" ];
        sansSerif = [ "EnvyCodeR Nerd Font" ];
        serif = [ "EnvyCodeR Nerd Font" ];
      };
    };
  };
}
