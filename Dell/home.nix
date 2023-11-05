{ pkgs, config, libs, ... }:

{

users.users.cpb.isNormalUser = true;
home-manager.users.cpb = { pkgs, ... }: {
  home.packages = [ pkgs.cowsay ];
  programs.bash.enable = true;
  programs.home-manager = {
  enable = true;

  };
  
 wayland.windowManager.sway = {
    enable = true;
    config = rec {
      assigns = {
        "1: web" = [{ class = "^Firefox$"; }]; 
      };
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "sakura"; 
      startup = [
        # Launch Firefox on start
        {command = "firefox";}
      ]; 
    };
  };



  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "23.05";
};


}
