{

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    };



  outputs = { self, nixpkgs }: {
    # replace 'joes-desktop' with your hostname here.
    nixosConfigurations.chrmflake = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ];
    };
  };
}
