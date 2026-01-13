{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix
    ../../modules/system/core
    ../../modules/system/common/fonts.nix
    ../../modules/system/hardware
    ../../modules/system/services
    ../../modules/system/common/bluetooth.nix
    ../../modules/system/containers
    ../../modules/system/gaming
    ../../modules/system/virtualization
    ../../modules/system/sysctl
    ../../modules/system/desktop
  ];

  modules.hardware.asusctl.enable = true;
  modules.hardware.razer.enable = true;
  modules.services.tuned.enable = true;
  modules.services.cpu-boost.enable = true;
  boot.consoleLogLevel = 3;

  boot.initrd.verbose = false;
  boot.kernelParams = [
    "video=2560x1600@120"
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "udev.log_priority=3"
    "rd.systemd.show_status=auto"
  ];
  boot.loader.timeout = 0;

  # Hostname
  networking.hostName = "glaceon";
  # Hardware & Graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.amdgpu.initrd.enable = true;
  services.tailscale.enable = true;
  # Nix Settings moved to common

  # IOS
  services.usbmuxd = {
    enable = true;
    package = pkgs.usbmuxd2;
  };

  # Desktop Environment

  ## Cosmic Desktop
  #services.desktopManager.cosmic.enable = true;
  #services.gnome.gnome-keyring.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  modules.gaming = {
    enable = true;
    gamescope = true;
  };
  # Virtualization
  modules.virtualization = {
    kvm = true;
    vmware = true;
  };
  modules.desktop = {
    plasma = true;
  };
  # Users
  users.users.luytan = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "dialout"
      "libvirtd"
    ];
  };

  # Programs

  nix.settings.allowed-users = [ "@wheel" ];

  system.stateVersion = "25.11";
}
