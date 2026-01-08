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
    ../../modules/system/core/common.nix
    ../../modules/system/common/fonts.nix
    ../../modules/system/hardware/razer.nix
    ../../modules/system/hardware/audio.nix
    ../../modules/system/common/bluetooth.nix
    ../../modules/system/containers/podman.nix
    ../../modules/system/hardware/nvidia.nix
    ../../modules/system/hardware/quadcast.nix
    ../../modules/system/common/virtualization.nix
    ../../modules/system/gaming
    ../../modules/system/services/nh.nix

  ];

  # Bootloader & Kernel

  # AMD Microcode
  # AMD Microcode moved to common

  boot.kernelPackages = pkgs.linuxPackages_6_18;
  # Plymouth
  # Plymouth moved to common

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

  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
    "vm.watermark_boost_factor" = 0;
    "vm.watermark_scale_factor" = 125;
    "vm.page-cluster" = 0;
  };

  # Networking & Time
  networking.hostName = "sylveon";
  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "random";
  };

  systemd.services.systemd-vconsole-setup.unitConfig.After = "local-fs.target";

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
  ## KDE Plasma
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
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

  environment.systemPackages = with pkgs; [
    gparted
  ];
  nix.settings.allowed-users = [ "@wheel" ];
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    sessionVariables.ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };

  # Zram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 300;
  };

  system.stateVersion = "25.11";
}
