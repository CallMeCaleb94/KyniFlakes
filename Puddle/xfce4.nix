{ pkgs, config, libs, ...}:

{

services.xserver.desktopManager.xfce = {
	enable = true;
	enableScreensaver = false;
	enableXfwm = true;
};

environment.xfce.excludePackages = with pkgs; [ 
		xfce.mousepad
		xfce.parole 
		xfce.ristretto 
		xfce.xfce4-taskmanager
		xfce.xfce4-terminal
		];


#services.xrdp = { 
#	enable = true;
#	defaultWindowManager = "${pkgs.i3}/bin/i3";
#	openFirewall = true;
#};

}
