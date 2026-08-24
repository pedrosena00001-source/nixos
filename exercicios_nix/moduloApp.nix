{ config, lib, pkgs, ... }:

{
        options = {
                meuApp.enable = lib.mkEnableOption "meuApp";
                meuApp.port = lib.mkOption { type = lib.types.ints.positive ; default = 8080; description = "Porta para o App";};
                meuApp.package = lib.mkOption { type = lib.types.package; default = pkgs.htop; description = "Pacote direto nos options";};
        };

        config = lib.mkMerge [
                {environment.systemPackages = ([config.meuApp.package]);}
        ];
}
