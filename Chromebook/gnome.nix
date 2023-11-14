{ config, pkgs, ... }:

{

environment.gnome.excludePackages = with pkgs; [
	gnome.cheese
	gnome-connections
	gnome.gnome-calculator
	geany
	gnome.totem
	gnome-photos
	gnome.simple-scan
	gnome.gnome-terminal
	gnome.gnome-system-monitor
	gnome.gnome-notes
	gnome.gnome-music
	gnome.gnome-maps
	gnome-tour
];

environment.systemPackages = with pkgs; [

	gnomeExtensions.appindicator
	gnomeExtensions.compact-top-bar
	gnomeExtensions.gtile
	gnomeExtensions.dash-to-panel
	gnomeExtensions.tray-icons-reloaded
	gnome.gnome-tweaks
	gnomeExtensions.arcmenu
	gnomeExtensions.gesture-improvements
	gnomeExtensions.paperwm
];

services.gnome.gnome-remote-desktop.enable = true;


}
