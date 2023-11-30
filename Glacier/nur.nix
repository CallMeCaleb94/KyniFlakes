{ config, pkgs, ... }:
{

# Enable NUR repo
nixpkgs.config.packageOverrides = pkgs: {
  nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
  inherit pkgs;
    };
  };

environment.systemPackages = with pkgs; [
   	nur.repos.kira-bruneau.pokemmo-installer
];
}
