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
  #OhMyZsh Configs
  oh-my-zsh = {
    enable = true;
    theme = "gnzh";
    plugins = [
        "git"
        "sudo" 
        "history"
        "docker"
        "fzf"
 	];
  };
  plugins = [
  		{                              
	          name = "vi-mode";
                  src = pkgs.zsh-vi-mode;
	          file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
	  }
                {
                         name = "fzf-tab";
                                 src = pkgs.fetchFromGitHub {
                                        owner = "Aloxaf";
                                        repo = "fzf-tab";
                                        rev = "v1.3.0";
                                        sha256 = "sha256-8atbysoOyCBW2OYKmdc91x9V/Mk3eyg3hvzvhJpQ32w=";
                 };
                }
	 ];

 initExtra = ''
    zstyle ':completion:*' menu select
    zstyle ':fzf-tab:*' fzf-preview 'ls --color $realpath 2>/dev/null || echo $realpath'
  '';
           #Aliases Para Meu Zsh 
          shellAliases = {
                 ll = "ls -la";
                 sv = "nvim";
                 up = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles/flakes#nixos";
		 updates = "sudo nix-channel --update";
		 fupdate = "sudo nix flake update --flake ~/nixos-dotfiles/flakes";
	         update = "cd ~/nixos-dotfiles/Scripts; ./update_system.zsh; up; cd"; 
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
