{ config, pkgs,lib, ... }:
{
imports = [
   ./options.nix
   ./lazy_nvim.nix
];
programs.nvf = {
 	enable = true;
	settings.vim = {
                        telescope  = {
                                enable = true;
                                mappings = {
                                        findFiles = "<leader>ff";
                                        liveGrep = "<leader>fg";
                                        buffers = "<leader>fb";
                                        helpTags = "<leader>fh";
                                        gitCommits = "<leader>fc";
                                        gitStatus = "<leader>fs";
                                         resume = "<leader>fr";
                                };
                        };
			options.number = true;
                        theme = {
                                enable = true;
                                name = "catppuccin";
                                style = "mocha";
                        };

                        autocomplete."blink-cmp" = {
                                enable = true;
                        };
        luaConfigRC.transparent_bg = ''
		local groups = { "Normal", "NormalNC", "NormalFloat", "SignColumn", "EndOfBuffer", "VertSplit", "LineNr" }
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
      end
	'';
	languages = {
			enableTreesitter = true;
                        nix = {
                                        enable = true;
                                        lsp.enable = true;
                                };
			python = {
                                        enable = true;
                                        lsp.enable = true;
                                };
			java = {
                                        enable = true;
                                        lsp.enable = true;
                                };
			css = {
				enable = true;
				lsp.enable = true;
		};
	};
        lsp.servers = {
                        basedpyright.cmd = lib.mkForce ["basedpyright-langserver" "--stdio"];
                        mappings = {
                                        referencesPicker = "<leader>gr";
                                        definitionPicker = "<leader>gd";
                                };
                 };

	treesitter.grammars = with pkgs.tree-sitter-grammars; [
        tree-sitter-bash
        tree-sitter-json
        tree-sitter-yaml
        tree-sitter-markdown
        tree-sitter-markdown-inline
      ];
     };
  };
}
