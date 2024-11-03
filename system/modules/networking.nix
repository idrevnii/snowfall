{ config, pkgs, ... }:

{
  networking = {
	hostName = "titanium";
	networkmanager.enable = true;
	enableIPv6 = false;
	firewall.enable = false;
  };
}
