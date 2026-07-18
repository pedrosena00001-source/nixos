{ config, lib, pkgs, ... }:
{
 programs.mako = {
  enable = true;
  defaultTimeout = 5000;
  backgroundColor = "#1e1e2eee";
  textColor = "#cdd6f4";
  borderColor = "#89b4fa";
  borderRadius = 8;
  borderSize = 2;
 };
}
