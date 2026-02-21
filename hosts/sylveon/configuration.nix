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
  networking.hostName = "sylveon";

  # Modules

  # Hardware
  modules.hardware = {
    peripherals.quadcast = true;
    peripherals.razer = true;
    graphics.amdgpu = true;
  };

  # Gaming
  modules.gaming = {
    enable = true;
    gamescope = true;
  };

  # Virtualization
  modules.virtualization = {
    kvm = true;
    vmware = true;
  };

  # Containers
  modules.containers = {
    docker = true;
    podman = true;
  };

  # Desktop
  modules.desktop = {
    plasma = true;
    niri = true;
  };

  # Services
  modules.services = {
    lact = true;
    tlp = true;
  };

  system.stateVersion = "25.11";
}
