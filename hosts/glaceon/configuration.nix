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
    ../../modules/system/hardware/asusctl.nix
    ../../modules/system/hardware/razer.nix
    ../../modules/system/hardware/audio.nix
    ../../modules/system/services/tuned.nix
    ../../modules/system/services/cpu-boost.nix
    ../../modules/system/common/bluetooth.nix
    ../../modules/system/containers/podman.nix
    ../../modules/system/services/nh.nix
    ../../modules/system/gaming
    ../../modules/system/virtualization
    ../../modules/system/sysctl
    ../../modules/system/hardware/network.nix
  ];
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

  # Networking & Time
  networking.hostName = "glaceon";
  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "random";
  };
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
  modules.gaming = {
    enable = true;
    gamescope = true;
  };
  # Virtualization
  modules.virtualization = {
    kvm = true;
    vmware = true;
  };
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
