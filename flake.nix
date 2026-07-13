{
    description ="Nixos from Scratch"; 
    inputs = {
           nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	   home-manager = {
                      url ="github:nix-community/home-manager/release-25.05";
                      inputs.nixpkgs.follows = "nixpkgs";
            };
    };

   outputs = { self, nixpkgs, home-manager, ... }: {
       nixosConfigurations.nixos = nixpkgs.lib.nixosSystem{
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
                home-manager.nixosModules.home-manager
                {
                   home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.pedro = import ./home.nix;
                        backupFileExtension = "backup";
                      };
                    } 
                  ]; 
                };
              };
}
