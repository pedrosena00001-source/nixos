{ config, pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        noto-fonts-color-emoji    
        fira-code-symbols
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "JetBrainsMono Nerd Font" ];
        serif = [ "JetBrainsMono Nerd Font" ];
      };
    };
  };
}
