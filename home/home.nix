{ pkgs, ... }:
{
  home.username = "anc13nt";
  home.homeDirectory = "/home/anc13nt";

  imports = [
    ./modules/apps.nix
    ./modules/git.nix
    ./modules/shell.nix
    ./modules/theme.nix
    ./modules/hyprland.nix
    ./modules/services.nix
  ];

  home.stateVersion = "25.05";
}