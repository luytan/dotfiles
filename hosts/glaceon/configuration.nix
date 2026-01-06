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
    ../../modules/system/hardware/asusctl.nix
    ../../modules/system/hardware/razer.nix
    ../../modules/system/hardware/audio.nix
    ../../modules/system/services/tuned.nix
    ../../modules/system/services/cpu-boost.nix
    ../../modules/system/common/bluetooth.nix
    ../../modules/system/containers/podman.nix
    ../../modules/system/services/nh.nix
    ../../modules/system/gaming
    ../../modules/system/common/virtualization.nix
  ];

  # Bootloader & Kernel

  # AMD Microcode
  # AMD Microcode moved to common
  boot.kernelPackages = pkgs.linuxPackages_6_18;

  # Plymouth moved to common

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

  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
    "vm.watermark_boost_factor" = 0;
    "vm.watermark_scale_factor" = 125;
    "vm.page-cluster" = 0;
  };

  # Networking & Time
  networking.hostName = "glaceon";
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
  hardware.amdgpu.initrd.enable = true;
  services.tailscale.enable = true;
  # Nix Settings moved to common

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

  # Virtualization
  virtualisation.libvirtd = {
    enable = true;

  };
  virtualisation.vmware.host.enable = true;
  programs.virt-manager.enable = true;

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
    packages = with pkgs; [
      vmware-workstation
    ];
  };

  # Programs

  nix.settings.allowed-users = [ "@wheel" ];

  # Zram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 300;
  };

  system.stateVersion = "25.11";
}
