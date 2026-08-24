{ config, lib, pkgs, ... }:
{
        options = {
                meuZsh.enable = lib.mkEnableOption "Zsh ligado";
                meuZsh.aliases = lib.mkOption { type = lib.types.attrsOf lib.types.str; default = {}; description = "Aliases Para Zsh";};
        };
        config = {
                home.packages = lib.mkIf (config.meuZsh.enable == true) ([pkgs.zsh pkgs.fzf]);
                programs.zsh = lib.mkIf (config.meuZsh.enable == true) ({enable = true; autosuggestion.enable = true; systaxHighlighting.enable = true; enableCompletion = true;});
                programs.zsh.shellAliases = lib.mkIf (config.meuZsh.enable == true) (config.meuZsh.aliases);
                programs.zsh.oh-my-zsh = lib.mkIf (config.meuZsh.enable == true) ({enable = true; theme = "half-life"; plugins = ["git" "sudo" "history"];});
        };
}
