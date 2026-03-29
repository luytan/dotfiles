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
    peripherals.razer = false;
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
    docker = false;
    podman = true;
  };

  # Desktop
  modules.desktop = {
    plasma = false;
    hyprland = {
      enable = true;
      shell = "caelestia";
    };
    niri = {
      enable = false;
      shell = "noctalia";
    };
  };

  # Services
  modules.services = {
    tlp = true;
  };
  services.cardwire.enable = true;

  system.stateVersion = "25.11";
}
