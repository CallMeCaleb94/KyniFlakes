{ config, pkgs, ... }:

{
environment.systemPackages = with pkgs; [
	bottom
	gcc
	gdu
	gitFull
	lazygit
	nerdfonts
	nodejs_18
	python3Full
	ripgrep
	neovim
	wl-clipboard
	xclip
];

}
