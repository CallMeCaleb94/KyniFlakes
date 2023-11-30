{ config, pkgs, ... }:

{
virtualisation.waydroid.enable = true;

virtualisation.docker.enable = true;
virtualisation.docker.rootless.enable = true;

}
