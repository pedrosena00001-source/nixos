{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;  
    font = "JetBrainsMono Nerd Font 12";

    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      icon-theme = "Papirus-Dark";
      display-drun = "";
      drun-display-format = "{name}";
    };

    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        bg = mkLiteral "#0a0a0a";
        bg-alt = mkLiteral "#1a1a1a";
        fg = mkLiteral "#e0e0e0";
        fg-alt = mkLiteral "#888888";
        border-color = mkLiteral "#ffffff";
      };

      "window" = {
        background-color = mkLiteral "@bg";
        border = mkLiteral "1px";
        border-color = mkLiteral "@border-color";
        border-radius = mkLiteral "0px";
        width = mkLiteral "600px";
      };

      "inputbar" = {
        background-color = mkLiteral "@bg-alt";
        text-color = mkLiteral "@fg";
        padding = mkLiteral "12px";
        border-radius = mkLiteral "0px";
      };

      "listview" = {
        background-color = mkLiteral "@bg";
        lines = mkLiteral "8";
        columns = mkLiteral "1";
      };

      "element" = {
        padding = mkLiteral "8px";
        background-color = mkLiteral "@bg";
        text-color = mkLiteral "@fg-alt";
      };

      "element selected" = {
        background-color = mkLiteral "@bg-alt";
        text-color = mkLiteral "@fg";
        border = mkLiteral "0px 0px 0px 2px";
        border-color = mkLiteral "@border-color";
      };

      "element-text" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
      };

      "element-icon" = {
        size = mkLiteral "24px";
      };
    };
  };
}
