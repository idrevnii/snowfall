{ pkgs, ... }:

{
  home.file = {
    ".config/hypr/hyprland.conf".source = ./../configs/hyprland/hyprland.conf;
    ".config/hypr/hyprpaper.conf".source = ./../configs/hyprland/hyprpaper.conf;
    ".config/waybar/config".source = ./../configs/waybar/config;
    ".config/waybar/style.css".source = ./../configs/waybar/style.css;
  };
}