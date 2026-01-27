{ config, lib, pkgs, ... }:
let
  cfg = config.modules.virtualization;
in
{
  config = lib.mkIf cfg.kvm {
    virtualisation.libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
    };
    programs.virt-manager.enable = true;
    environment.systemPackages = with pkgs; [
      virt-what
    ];
    boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  };
}
