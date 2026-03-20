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
    inputs.cardwire.nixosModule.x86_64-linux
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
    plasma = false;
    niri = true;
    hyprland = false;
  };

  # Services
  modules.services = {
    tlp = true;
  };
  services.cardwire.enable = true;

  system.stateVersion = "25.11";
}
