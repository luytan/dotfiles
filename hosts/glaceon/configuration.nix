{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix
    ../../modules/system
    inputs.chainsaw.nixosModules.chainsaw
  ];

  # Hostname
  networking.hostName = "glaceon";

  # Modules

  # Hardware
  modules.hardware = {
    platform.asusctl = true;
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
    tlp = true;
  };
  services.chainsaw.enable = true;

  system.stateVersion = "25.11";
}
