{ config, pkgs, ... }:

{
environment.systemPackages = with pkgs; [
  	bottom
	gcc
	gdu	
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
