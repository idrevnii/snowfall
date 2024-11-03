{ config, pkgs, lib, ... }:

{
  boot = {
        tmp.cleanOnBoot = true;
	supportedFilesystems = ["ntfs"];
	loader = {
	  systemd-boot.enable = true;
	  efi.canTouchEfiVariables = true;
	};
   };

  environment.systemPackages = with pkgs; [
    sbctl
  ];
}
