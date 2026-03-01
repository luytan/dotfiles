{ pkgs, lib, inputs, ... }:
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
    kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
    };
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.consoleMode = "max";
      timeout = 0;
      systemd-boot.enable = lib.mkForce false;
    };
    initrd = {
      systemd.enable = true;
      verbose = false;
    };
    plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      extraConfig = ''
        DeviceScale=1
        UseFirmwareBackground=false
      '';
      themePackages = with pkgs; [
        nixos-bgrt-plymouth
      ];
    };

    # Lanzaboote
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    tmp.useTmpfs = true;
  };

  environment.systemPackages = [ pkgs.sbctl ];
}
