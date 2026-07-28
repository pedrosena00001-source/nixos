{ config, pkgs, ... }:
{
  programs.nvf.settings.vim = {
    options = {
      number = true;
      wrap = true;
      linebreak = true;
      breakindent = true;
    };

    keymaps = [
      { mode = ["v"]; key = "K"; action = ":m '<-2<CR>gv=gv"; silent = true; }
      { mode = ["v"]; key = "J"; action = ":m '>+1<CR>gv=gv"; silent = true; }
      { mode = ["n"]; key = "<A-k>"; action = ":m .-2<CR>=="; silent = true; }
      { mode = ["n"]; key = "<A-j>"; action = ":m .+1<CR>=="; silent = true; }
      { mode = ["i"]; key = "<A-j>"; action = "<Esc>:m .+1<CR>==gi"; silent = true; }
      { mode = ["i"]; key = "<A-k>"; action = "<Esc>:m .-2<CR>==gi"; silent = true; }
    ];
  };
}
