{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_6_19;
    kernelParams = [
      "video=2560x1600@120"
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
    };
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.consoleMode = "max";
      timeout = 0;
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
}
