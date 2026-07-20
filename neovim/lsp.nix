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
		  vim.lsp.config("nil_ls", {})
    vim.lsp.config("lua_ls", {})
    vim.lsp.config("pyright", {})
    vim.lsp.config("rust_analyzer", {})
    vim.lsp.config("gopls", {})

    vim.lsp.enable({
      "nil_ls",
      "lua_ls",
      "pyright",
      "rust_analyzer",
      "gopls",
    })
  '';
}
