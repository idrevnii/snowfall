{ pkgs, ... }:

{
  programs.zsh.enable = true;
  
  home.file.".zshrc" = {
    source = ./../configs/zsh/.zshrc; 
    force = true; 
  };
  
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrains Mono";
      size = 12;
    };
    settings = {
      background_opacity = "0.9";
    };
  };
}