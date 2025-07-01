{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # browsers
    google-chrome

    # editors
    vscodium

    # cli
     htop
    neofetch
    ripgrep
    fd
    bat     
    zoxide 

    # bar
    waybar  

    # launcher
    wofi    

    # notification server
    mako    
  ];
}