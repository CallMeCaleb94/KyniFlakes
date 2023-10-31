{ config, pkgs, ... }:

{
environment.systemPackages = with pkgs; [
	bottom
	gdu
	git
	lazygit
	nerdfonts
	nodejs_18
	python3Full
	ripgrep
	neovim
	wl-clipboard
];

}
