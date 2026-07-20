{
    description = "Nixos from Scratch"; 
    inputs = {
           nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	  home-manager = {
                      url = "github:nix-community/home-manager/master";
                      inputs.nixpkgs.follows = "nixpkgs";
            };
    };
   outputs = { self, nixpkgs, home-manager, ... }: {
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
                        extraSpecialArgs = { inherit self; };
                        users.pedro = import ../home.nix;
                      };
                    } 
                  ]; 
                };
              };
}
