{ config, lib, pkgs, ... }:
{
      programs.zsh = {
          enable = true;
          autosuggestions.enable = true;    
          syntaxHighlighting.enable = true; 
          enableCompletion = true;
  oh-my-zsh = {
    enable = true;
    theme = "gnzh";
    plugins = [
        "git"
        "sudo" 
        "history"
        "docker"
	];
  };
  plugins = [
  		{                              
	          name = "vi-mode";
                  src = pkgs.zsh-vi-mode;
	          file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
	  }
	];
          shellAliases = {
                 ll = "ls -la";
                 sv = "nvim";
                 up = "sudo nixos-rebuild switch --flake .#nixos";
                 v = "vim";
                 garbage = "sudo nix-collect-garbage -d";
                 cdd = "cd nixos-dotfiles";
                 gm = "git commit -m";
                 ga = "git add";
                 gs = "git status";
                 gp = "git push origin main";
                 gpm = "git push origin master";
                 ns = "nix-shell -p";
                 sh = "shutdown -h now";
 		 re = "reboot";
                 gaa = "git add -A";
		 sd = "docker";
          };
    };
}
