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
      theme = "nixos-bgrt";
      extraConfig = ''
        UseFirmwareBackground=false
      '';
      themePackages = with pkgs; [
        nixos-bgrt-plymouth
      ];

    };
    tmp.useTmpfs = true;
  };
  hardware.enableAllFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;
}
