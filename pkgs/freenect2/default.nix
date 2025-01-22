{ pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ./freenect2.nix {}
