{ config, lib, pkgs, ... }:
let
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url = https://github.com/nix-community/nix-doom-emacs/archive/master.tar.gz;
        sha256 = "sha256:05sfdi0bxiidf8b8f4dibzvm7zvlksn92d4qq8rvf8k45gnfjfkd";
  }) {
    doomPrivateDir = ./doom.d;
                             
  };
in {
  home.packages = [ doom-emacs ];
}
