{ pkgs, ... }:
{
  # Virtualization
  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  };
  programs.virt-manager.enable = true;
  virtualisation.vmware.host.enable = true;
  environment.systemPackages = with pkgs; [
    vmware-workstation
    virt-what

  ];
}
