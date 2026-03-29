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
    ../../modules/system
  ];

  # Hostname
  networking.hostName = "leafeon";

  # Modules

  # Hardware
  modules.hardware = {
    peripherals.razer = true;
    graphics.intel = true;
  };

  # Gaming
  modules.gaming = {
    enable = false;
    gamescope = false;
  };

  # Virtualization
  modules.virtualization = {
    kvm = true;
    vmware = true;
  };

  # Containers
  modules.containers = {
    docker = false;
    podman = true;
  };

  # Desktop
  modules.desktop = {
    plasma = true;
    niri = {
      enable = false;
      shell = "noctalia";
    };
    hyprland = {
      enable = false;
      shell = "illogical";
    };
  };

  # Services
  modules.services = {
    tlp = true;
  };

  system.stateVersion = "25.11";
}
