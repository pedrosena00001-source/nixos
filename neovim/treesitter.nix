{ config, pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    (nvim-treesitter.withPlugins (p: [
      p.nix
      p.lua
      p.vim
      p.vimdoc
      p.bash
      p.json
      p.yaml
      p.markdown
      p.markdown_inline
      p.python
      p.javascript
      p.typescript
      p.html
      p.css
    ]))
  ];

  programs.neovim.extraLuaConfig = ''
 require("nvim-treesitter").setup()

    local ts_filetypes = {
      "nix", "lua", "vim", "vimdoc", "bash", "json", "yaml",
      "markdown", "markdown_inline", "python", "javascript",
      "typescript", "html", "css",
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = ts_filetypes,
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
      end,
    })
  '';
}
