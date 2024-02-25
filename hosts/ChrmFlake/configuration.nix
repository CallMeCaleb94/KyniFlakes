# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./gnome.nix
      ./neovim.nix
      #./nur.nix
      ./steam.nix
      ./virtual.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.isContainer = false;
  
  networking.hostName = "chrmflake"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Detroit";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  #services.printing.enable = false;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cpb = {
    isNormalUser = true;
    description = "Caleb P. Bradley";
    extraGroups = [ "adbusers" "docker " "networkmanager" "wheel" ];
    packages = with pkgs; [
	    bitwarden
	    fish
	    firefox
	    gitFull
	    lsd
	    thunderbird
    ];
    shell = "${pkgs.fish}/bin/fish";
  };

  # Enable fish
  programs.fish.enable = true;

  # Enble ADB
  programs.adb.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	  curl
	  distrobox
	  obsidian
	  qemu
	  sakura
	  remmina
	  spotify
	  wget
    vscode-fhs
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
 	  enable = true;
	  enableSSHSupport = true;
    pinentryFlavor = "gnome3";
   };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
	services.openssh.enable = true;

  # Firewall Module
  networking.firewall= {
  enable = true;
  allowedUDPPorts = [ 3389 22 80];
  allowedTCPPorts = [ 22 80]; };

  # AutoUpgrade
#  system.autoUpgrade = {
 #   enable = true;
  #  channel = "https://nixos.org/channels/nixos-23.11";
  #};

  nixpkgs.config.permittedInsecurePackages = [
                "electron-25.9.0"
              ];

  nix = {
  package = pkgs.nixFlakes;
  settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
    };
  };

  # Automatic Garbage Collection
  nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "-d";
      persistent = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}