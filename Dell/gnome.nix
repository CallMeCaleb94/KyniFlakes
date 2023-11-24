{ config, pkgs, ... }:

{

environment.gnome.excludePackages = with pkgs.gnome; [
	baobab 
	cheese 
	eog 
	epiphany
	gedit
	simple-scan
	totem
	yelp
	evince
	geary
	seahorse
	gnome-calculator
	gnome-characters 
	gnome-contacts
    	gnome-font-viewer
	gnome-logs
	gnome-maps
	gnome-music
	gnome-system-monitor
	gnome-terminal
	pkgs.gnome-connections
	pkgs.gnome-text-editor
	pkgs.gnome-tour
	pkgs.gnome-photos
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
