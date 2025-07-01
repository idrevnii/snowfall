{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/core.nix
    ./modules/hyprland.nix
    ./modules/vfio.nix
  ];
}