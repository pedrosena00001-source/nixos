{ config, lib, pkgs, ...}:
{
        options = {
                meuApp.instancias = lib.mkOption { type = lib.types.attrsOf lib.types.str; default = {}; description = "Lista de instancias"; };

        };
        config = {
                meuApp.instancias = {
                        instancias = "Primeiro";
                        instancias2 = "Segundo";
                        instancias3 = "Terceiro";

                };

        };
}
