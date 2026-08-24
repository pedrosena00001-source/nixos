{ lib, config, ... }:
{
        options = {
                meuServico.mensagem = lib.mkOption { type = lib.types.str; default = "Olá Mundo"; description = "Modulo De String"; };
                meuServico.porta = lib.mkOption { type = lib.types.ints.between 1024 65535; default = 1024 ; description = "Restrição Para Portas Exemplo"; };
                meuServico.tags = lib.mkOption { type = lib.types.listOf lib.types.str ; default = []   ; description = "Lista De Strings No Modulos"; };
                meuServico.ambiente = lib.mkOption { type = lib.types.enum [ "desenvolvimento" "teste" "producao"]; default = "desenvolvimento"; description = "Enum"; };
                meuServico.ativado = lib.mkEnableOption "meu Servico";
        };
        config = lib.mkMerge [
                {environment.variables.VariavelSistema = config.meuServico.mensagem;} 
                {environment.variables.Validar = lib.mkIf (config.meuServico.ativado == true) ( config.meuServico.mensagem);} 
                {assertions = [{assertion = config.meuServico.ativado == false || config.meuServico.porta != 1024; message = "Erro Na Porta";}];}


        ];


}
