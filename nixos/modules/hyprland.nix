{ config, pkgs, inputs, ... }:

{
  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

  programs.hyprland.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

 environment.systemPackages = with pkgs; [
    hyprpaper  
    wl-clipboard 
    wlogout  
  ];
}