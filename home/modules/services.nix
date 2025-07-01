{ config, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      font = "JetBrains Mono 10";
      padding = "10";
      border-size = "2";
      border-radius = "5";
      default-timeout = "5000";
      
      background-color = "#${config.colorScheme.palette.base00}";
      text-color = "#${config.colorScheme.palette.base05}";
      border-color = "#${config.colorScheme.palette.base0D}";
    };
  };
}