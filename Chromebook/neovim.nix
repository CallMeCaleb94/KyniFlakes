{ config, pkgs, ... }:

{
environment.systemPackages = with pkgs; [
  bottom
	gdu
	git
	lazygit
	nerdfonts
	neovim
	nodejs_18
  python3Full
	ripgrep
  wl-clipboard
];

}
