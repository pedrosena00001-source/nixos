{ config, pkgs, ... }:
{
imports = [
   ./options.nix
   ./lazy_nvim.nix
];
programs.nvf = {
 	enable = true;
	settings.vim = {
			options.number = true;

        luaConfigRC.transparent_bg = ''
		vim.opt.number = true
		local groups = { "Normal", "NormalNC", "NormalFloat", "SignColumn", "EndOfBuffer", "VertSplit", "LineNr" }
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
      end
	'';
	languages = {
			enableTreesitter = true;

			nix.enable = true;
			lua.enable = true;
			python.enable = true;
			java.enable = true;

			css = {
				enable = true;
				lsp.enable = true;
		};
	};
	treesitter.extraParsers = with pkgs.tree-sitter-grammars; [
        tree-sitter-bash
        tree-sitter-json
        tree-sitter-yaml
        tree-sitter-markdown
        tree-sitter-markdown-inline
        tree-sitter-vimdoc
      ];
     };
}
