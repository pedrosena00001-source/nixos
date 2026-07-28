{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ papirus-icon-theme ];  
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;   
    font = "JetBrainsMono Nerd Font 12";
    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      icon-theme = "Papirus-Dark";
      display-drun = "";
      drun-display-format = "{name}";
      location = 0;      # topo
      xoffset = 0;
      yoffset = 0;
    };
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        bg = mkLiteral "#000000";
        bg-alt = mkLiteral "#1c1c1c";
        fg = mkLiteral "#ffffff";
        fg-alt = mkLiteral "#8a8a8a";
        border-color = mkLiteral "#ffffff";
        border-color-alt = mkLiteral "#4d4d4d";
      };
       "window" = {
        background-color = mkLiteral "@bg";
        border = mkLiteral "0px 0px 2px 0px";
        border-color = mkLiteral "@border-color";
        border-radius = mkLiteral "0px";
        width = mkLiteral "100%";
        height = mkLiteral "38px";
        anchor = mkLiteral "north";
        location = mkLiteral "north";
        padding = mkLiteral "0px";
      };
      "mainbox" = {
        background-color = mkLiteral "@bg";
        children = mkLiteral "[ inputbar, listview ]";
        orientation = mkLiteral "horizontal";
        padding = mkLiteral "0px";
        spacing = mkLiteral "0px";
      };
      "inputbar" = {
        background-color = mkLiteral "@bg-alt";
        text-color = mkLiteral "@fg";
        padding = mkLiteral "6px 10px";
        border-radius = mkLiteral "0px";
        border = mkLiteral "0px 1px 0px 0px";
        border-color = mkLiteral "@border-color";
        children = mkLiteral "[ prompt, entry ]";
        spacing = mkLiteral "8px";
        width = mkLiteral "220px";
      };
      "listview" = {
        background-color = mkLiteral "@bg";
        lines = mkLiteral "1";
        columns = mkLiteral "10";
        layout = mkLiteral "horizontal";
        spacing = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px";
        fixed-height = mkLiteral "true";
      };
      "prompt" = {
        text-color = mkLiteral "@fg-alt";
        background-color = mkLiteral "transparent";
      };
      "entry" = {
        text-color = mkLiteral "@fg";
        background-color = mkLiteral "transparent";
        placeholder = mkLiteral "\"\"";
      };
       "element" = {
        padding = mkLiteral "6px 10px";
        background-color = mkLiteral "@bg";
        text-color = mkLiteral "@fg-alt";
        border = mkLiteral "0px 1px 0px 0px";
        border-color = mkLiteral "@border-color-alt";
        orientation = mkLiteral "horizontal";
        children = mkLiteral "[ \"element-icon\", \"element-text\" ]";
      };
      "element-icon" = {
        size = mkLiteral "16px";
        background-color = mkLiteral "transparent";
        vertical-align = mkLiteral "0.5";
      };
      "element-text" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0";
      };
    };
  };
}
