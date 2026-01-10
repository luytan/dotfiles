{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_6_18;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.systemd.enable = true;
  boot.plymouth = {
    enable = true;
    theme = "bgrt";
  };
  hardware.enableAllFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;
}
