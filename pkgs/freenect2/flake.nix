{
  description = "freenect2 package";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux = with import nixpkgs { system = "x86_64-linux"; };
      callPackage ./freenect2/freenect2.nix {};
  };
}
