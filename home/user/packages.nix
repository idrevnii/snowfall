{ pkgs, pkgs-unstable, ... }:

{
  

  home.packages = [

    # Dev stuff
    pkgs.gcc
    pkgs.go
    pkgs.lua
    pkgs.nodejs_21
    pkgs.nodePackages.pnpm
    (pkgs.python3.withPackages (python-pkgs: [
        python-pkgs.pip
        python-pkgs.requests
    ]))
    
    # Work stuff
    pkgs.obsidian
    pkgs.thunderbird
 
    # Social
    pkgs.telegram-desktop

    # Gaming
    pkgs.steam
    pkgs.steam-run
    pkgs.yuzu-mainline
    (pkgs.lutris.override {
      extraPkgs = pkgs: [
        pkgs.wineWowPackages.stable
        pkgs.winetricks
      ];
    })

    # Downloads
    pkgs.qbittorrent

    # Utils
    pkgs.viewnior
    pkgs-unstable.hyprshot
    pkgs.catppuccin-cursors.macchiatoBlue
    pkgs.catppuccin-gtk
    pkgs.papirus-folders
  ];
}
