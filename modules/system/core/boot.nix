{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_6_18;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.consoleMode = "max";
    };
    initrd.systemd.enable = true;
    plymouth = {
      enable = true;
      theme = "bgrt";
    };
    tmp.useTmpfs = true;
  };
  hardware.enableAllFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;
}
