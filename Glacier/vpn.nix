{ config, libs, pkgs, ... }:

{

  services.openvpn.servers = {
    homeVPN = { config = '' config /root/nixos/openvpn/homeVPN.conf ''; };
  };

}
