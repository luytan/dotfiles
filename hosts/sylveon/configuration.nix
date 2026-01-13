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
    ../../modules/system/common/bluetooth.nix
    ../../modules/system/containers
    ../../modules/system/virtualization
    ../../modules/system/gaming
    ../../modules/system/sysctl
    ../../modules/system/services
  ];

  modules.hardware.nvidia.enable = true;
  modules.hardware.quadcast.enable = true;
  modules.hardware.razer.enable = true;
  boot.consoleLogLevel = 3;

  boot.initrd.verbose = false;
  boot.kernelParams = [
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "udev.log_priority=3"
    "rd.systemd.show_status=auto"
  ];
  boot.loader.timeout = 0;

  # Hostname
  networking.hostName = "sylveon";

  # Hardware & Graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.tailscale.enable = true;
  services.seatd.enable = true;

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

  # Services
  # Services moved to common

  # Users
  users.users.luytan = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "dialout"
      "libvirtd"
    ];
  };
  # Gaming
  modules.gaming = {
    enable = true;
    gamescope = false; #nvidia
  };
  
  # Virtualization
  modules.virtualization = {
    kvm = true;
    vmware = true;
  };


  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    sessionVariables.ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };

  system.stateVersion = "25.11";
}
