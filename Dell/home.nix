{ pkgs, config, libs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{

users.users.cpb.isNormalUser = true;
home-manager.users.cpb = { pkgs, ... }: {
  home.packages = [ pkgs.cowsay ];

  programs.home-manager = {
    enable = true;

  };
  
programs.git = {
  enable = true;
  userName = "CallMeCaleb94";
  userEmail = "calebcodes94@gmail.com";
  lfs.enable = true;
  extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
};

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "23.05";
};


}
