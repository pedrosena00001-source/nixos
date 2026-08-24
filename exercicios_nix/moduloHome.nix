{ config, lib, pkgs, ... }:
{
        options = {
                
                meuApp.aliasGit = lib.mkOption { type = lib.types.str; default = "git add ."; description = "aliases para git";};
        };
        config = {
                programs.git.aliases = {
                        ga = config.meuApp.aliasGit;

                };
        };
}
