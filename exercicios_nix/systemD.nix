{ config, lib, pkgs, ...}:
{
        options = {
                meuApp.enable = lib.mkEnableOption "ativado";
                meuApp.port = lib.mkOption { type = lib.types.ints.positive; default = 8080; description = "porta";};
        }; 

        config = lib.mkMerge [
                {systemd.services.meuApp = lib.mkIf (config.meuApp.enable == true) ({wantedBy = ["multi-user.target"]; description = "serviço systemd basico"; serviceConfig = {Type = "forking"; ExecStart = "echo iniciando";};});}
        ];

}
