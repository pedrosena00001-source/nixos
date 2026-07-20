{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nil                    
    lua-language-server   
  ];

  programs.neovim.plugins = with pkgs.vimPlugins; [
    nvim-lspconfig
  ];

  programs.neovim.extraLuaConfig = ''
    local lspconfig = require("lspconfig")

    lspconfig.nil_ls.setup({})
    lspconfig.lua_ls.setup({})
    lspconfig.pyright.setup({})
    lspconfig.rust_analyzer.setup({})
    lspconfig.gopls.setup({})
  '';
}
