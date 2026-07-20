{ config, pkgs, ... }:
{
imports = [
   ./options.nix
   ./lazy_nvim.nix
   ./treesitter.nix
   ./lsp.nix
];
programs.neovim = {
 	enable = true;
	extraLuaConfig = ''
		vim.opt.number = true
		local groups = { "Normal", "NormalNC", "NormalFloat", "SignColumn", "EndOfBuffer", "VertSplit", "LineNr" }
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
      end
	'';
     };
}
