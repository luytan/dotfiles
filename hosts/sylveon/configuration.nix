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

  environment = {
    sessionVariables.WAYLANDDRV_PRIMARY_MONITOR = "DP-2";
  };

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
    lact = true;
    tlp = false;
  };

  system.stateVersion = "25.11";
}
