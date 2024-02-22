# default.nix

{  pkgs ? import <nixpkgs> {}, lib ? pkgs.lib }:

let
  PokeMMO = pkgs.callPackage ./pokemmo-installer.nix { inherit pkgs; };
in
{
  inherit PokeMMO;
}

