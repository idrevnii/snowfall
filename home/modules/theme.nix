{ config, pkgs, inputs, ... }:

let
  nightOwl = {
    name = "night-owl";
    
    # Описываем палитру из 16 цветов
    palette = {
      base00 = "011627"; # Фон
      base01 = "1d3b53";
      base02 = "5f7e97"; # Комментарии
      base03 = "a1a1a1";
      base04 = "d6deeb";
      base05 = "d6deeb"; # Основной текст
      base06 = "ffffff";
      base07 = "ffffff";
      base08 = "ef5350"; # Красный
      base09 = "ffca28"; # Оранжевый
      base0A = "c5e478"; # Желто-зеленый
      base0B = "22da6e"; # Зеленый
      base0C = "24d0c6"; # Голубой
      base0D = "82aaff"; # Синий
      base0E = "c792ea"; # Фиолетовый
      base0F = "ff5874"; # Розовый
    };
  };
in
{
  imports = [ inputs.nix-colors.homeManagerModules.default ];
  colorScheme = nightOwl;

  programs.nix-colors.enable = true;

  home.pointerCursor = {
    name = "Adwaita";
    size = 24;
    package = pkgs.gnome.adwaita-icon-theme;
  };
  
  programs.kitty.colorScheme = {
    inherit (config.colorScheme) name;
    settings = config.colorScheme.palette;
  };

  home.file.".config/hypr/colors.conf".text = ''
    $color_background = 0x${config.colorScheme.palette.base00}
    $color_foreground = 0x${config.colorScheme.palette.base05}
    
    $color_active_border = rgb(${config.colorScheme.palette.base0D})
    $color_inactive_border = rgb(${config.colorScheme.palette.base01})
  '';
}