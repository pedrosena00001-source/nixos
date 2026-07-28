{
    description = "Nixos from Scratch"; 
    inputs = {
           nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	   nvf.url = "github:notashelf/nvf";
           nvf.inputs.nixpkgs.follows = "nixpkgs";
	  home-manager = {
                      url = "github:nix-community/home-manager/master";
                      inputs.nixpkgs.follows = "nixpkgs";
            };
    };
   outputs = inputs@{ self, nixpkgs, home-manager, nvf, ... }: {
		packages."x86_64-linux".default =
			(nvf.lib.neovimConfiguration {
				pkgs = nixpkgs.legacyPackages."x86_64-linux";
				modules = [ ./nvf-configuration.nix ];
			}).neovim;
       nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ../nix/configuration.nix
                home-manager.nixosModules.home-manager
                {
                   home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        backupFileExtension = "backup";
                        extraSpecialArgs = { inherit inputs self; };
                        users.pedro = import ../home.nix;
                      };
                    } 
                  ]; 
                };
              };
}
