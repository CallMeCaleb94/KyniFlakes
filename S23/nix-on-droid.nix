{ config, lib, pkgs, ... }:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
        fish
        gcc
        git
        neovim
        diffutils
        findutils
        utillinux
        tzdata
        hostname
        man
        nettools
        ncurses
        nerdfonts
        lsd
        bottom
        nodejs_18
        openssh
        python3Full
        ripgrep
        gnugrep
        gnupg
        gnused
        gnutar
        bzip2
        gzip
        xz
        zip
        unzip
  ];

  user.shell = "${pkgs.fish}/bin/fish";


  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "23.05";

  # Set up nix for flakes
  #nix.extraOptions = ''
  #  experimental-features = nix-command flakes
  #'';

  # Set your time zone
  time.timeZone = "America/Detroit";

  # After installing home-manager channel like
  #   nix-channel --add https://github.com/rycee/home-manager/archive/release-23.05.tar.gz home-manager
  #   nix-channel --update
  # you can configure home-manager in here like
  #home-manager = {
  #  useGlobalPkgs = true;
  #
  #  config =
  #    { config, lib, pkgs, ... }:
  #    {
  #      # Read the changelog before changing this value
  #      home.stateVersion = "23.05";
  #
  #      # insert home-manager config
  #    };
  #};
}

# vim: ft=nix
