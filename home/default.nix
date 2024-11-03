{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  imports = [
    ./user
  ];
  
  home.username = "anc13nt";
  home.homeDirectory = "/home/anc13nt";
  home.stateVersion = "23.11";
}

