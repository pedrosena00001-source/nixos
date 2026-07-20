 { config, lib, pkgs, ... }:
 {
      programs.fzf = {
           enable = true;
	   enableZshIntegration =true;
      };
      programs.zsh = {
          enable = true;
          autosuggestion.enable = true;    
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
                 up = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles/flakes#nixos";
		 updates = "sudo nix-channel --update";
		 fupdate = "sudo nix flake update --flake ~/nixos-dotfiles/flakes";
	         update = "cd ~/nixos-dotfiles/Scripts; ./update_system.zsh; cd"; 
                 v = "vim";
                 garbage = "sudo nix-collect-garbage -d";
                 cdd = "cd ~/nixos-dotfiles";
	         cds = "cd ~/nixos-dotfiles/Scripts";
		 cdf = "cd ~/nixos-dotfiles/flakes";
	         cdw = "cd ~/nixos-dotfiles/window-manager";
		 cdn = "cd ~/nixos-dotfiles/nix";
	         cdv = "cd ~/nixos-dotfiles/neovim";
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
