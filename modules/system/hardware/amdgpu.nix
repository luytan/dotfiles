{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.hardware.amdgpu;
in
{
  options.modules.hardware.amdgpu.enable = lib.mkEnableOption "amdgpu";

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
  };
}
