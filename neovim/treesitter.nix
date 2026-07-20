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
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>v",
          node_incremental = "<leader>v",
          node_decremental = "<leader>V",
        },
      },
    })
  '';
}
