{ config, pkgs, ... }:

{
  users.users.anc13nt = {
     isNormalUser = true;
     shell = pkgs.zsh;
     password = "256637cc";
     extraGroups = [ 
     	"wheel" 
        "qemu"
        "kvm"
        "libvirtd"
        "audio"
        "video"
        "networkmanager"
     ]; 
   };
}
