{ config, pkgs, ... }:

{
  boot.kernelParams = [
    "amd_iommu=on"
    # !!! ВАЖНО: Замените ID на свои от `lspci -nn | grep -i nvidia` !!!
    "vfio-pci.ids=10de:xxxx,10de:yyyy" 
  ];

  boot.initrd.kernelModules = [ "vfio_pci" "vfio" "vfio_iommu_type1" ];
  boot.blacklistedKernelModules = [ "nvidia" "nouveau" ];

  programs.virt-manager.enable = true;
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
  

  virtualisation.libvirtd.qemu.domain."win10" = {
    xml = ''
      <devices>
        <sound model='ich9'>
          <audio id='1'/>
        </sound>
        <audio id='1' type='spice'/>
        <graphics type='spice' autoport='yes'>
          <listen type='address'/>
          <image compression='off'/>
        </graphics>
      </devices>
    '';
  };

  # --- Сеть ---
  # !!! ВНИМАНИЕ: Если не заменить enpXsY, сеть на хосте перестанет работать!
  # Найдите имя интерфейса командой `ip a`.
  networking.useDHCP = false;
  networking.interfaces."enpXsY" = {
    useDHCP = false;
  };
  networking.bridges.br0 = {
    interfaces = [ "enpXsY" ];
    useDHCP = true;
  };

  environment.systemPackages = with pkgs; [
    looking-glass-client
  ];

  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 anc13nt qemu-libvirtd -"
  ];
}