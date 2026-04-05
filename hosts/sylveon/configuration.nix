{
  inputs,
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
    plasma = false;
    niri = {
      enable = false;
      shell = "noctalia";
    };
    hyprland = {
      enable = true;
      shell = "caelestia";
    };
  };

  # Services
  modules.services = {
    lact = true;
    tlp = false;
  };
  services.power-profiles-daemon.enable = true;

  boot = {
    kernelPackages =
      let
        customKernel = pkgs.cachyosKernels.linux-cachyos-latest-lto-zen4.override {
          cpusched = "bore";
        };

        helpers = pkgs.callPackage "${inputs.nix-cachyos-kernel.outPath}/helpers.nix" { };

      in
      helpers.kernelModuleLLVMOverride (pkgs.linuxKernel.packagesFor customKernel);
  };

  system.stateVersion = "25.11";
}
