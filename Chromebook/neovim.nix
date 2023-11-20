{ config, pkgs, ... }:

{
environment.systemPackages = with pkgs; [
  	bottom
	gcc
	gdu
	gitFull
	lazygit
	nerdfonts
	neovim
	nodejs_18
  	python3Full
	ripgrep
 	wl-clipboard
	xclip
];

}