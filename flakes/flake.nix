{
    description = "nixos from scratch"; 
    inputs = {
           nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	   nvf.url = "github:notashelf/nvf";
           nvf.inputs.nixpkgs.follows = "nixpkgs";
                nix-doom-emacs-unstraightened = {
                        url = "github:marienz/nix-doom-emacs-unstraightened";
                };
                flake-parts = {
                    url = "github:hercules-ci/flake-parts";
                };
                import-tree = {
                  url = "github:denful/import-tree";
                };
                hyprland = {
                        url = "github:hyprwm/Hyprland";
                };
	  home-manager = {
                      url = "github:nix-community/home-manager/master";
                      inputs.nixpkgs.follows = "nixpkgs";
            };
    };


    outputs = inputs@{ nvf, nix-doom-emacs-unstraightened, flake-parts ,import-tree, nixpkgs, home-manager, self, ... }:
      flake-parts.lib.mkFlake {inherit inputs;} ({ config, ... }: { systems = ["x86_64-linux"];
                                                                    imports =  [inputs.import-tree ./modules];


                    	flake.packages."x86_64-linux".default =
			(nvf.lib.neovimConfiguration {
				pkgs = nixpkgs.legacyPackages."x86_64-linux";
				modules = [ ./nvf-configuration.nix ];
			}).neovim;
       flake.nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ../nix/configuration.nix
                home-manager.nixosModules.home-manager
                config.flake.modules.nixos.hyprland
                

                {
                   home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        backupFileExtension = "backup";
                        extraSpecialArgs = { inherit inputs self; };
                        users.pedro.imports = [
                          ../home.nix
                          config.flake.modules.homeManager.hyprland
                        ]; 
                      };
                    } 
                  ]; 
                };
             }
        )
        ;
}
