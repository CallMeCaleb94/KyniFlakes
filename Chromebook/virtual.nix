{ pkgs, conifg , libs, ... }:

{

virtualisation.waydroid.enable = true;

virtualisation.docker.enable = true;

virtualisation.docker.rootless.enable = true;

}
