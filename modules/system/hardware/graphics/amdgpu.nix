{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.hardware.graphics.amdgpu;
in
{
  options.modules.hardware.graphics.amdgpu.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    boot.initrd.kernelModules = [ "amdgpu" ];

    # XServer / generic video driver
    services.xserver.videoDrivers = [ "amdgpu" ];

    # Graphics drivers and extra packages
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libva
        libva-utils
        rocmPackages.clr.icd # OpenCL
      ];
    };
    boot.kernelParams = [
      "amdgpu.dpm=1" # Enable dynamic power management
      "pcie_aspm=force" # Force PCIe Active State Power Management
    ];

    hardware.amdgpu.initrd.enable = true;
  };
}
