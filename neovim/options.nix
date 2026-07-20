{ config, pkgs, ... }:
{

      programs.neovim.extraLuaConfig = ''
      vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })
      vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
      vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', opts)
      vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', opts)
      vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
      vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
      '';
}
