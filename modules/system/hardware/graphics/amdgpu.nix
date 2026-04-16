{
  config,
  lib,
  pkgs,
  user,
  ...
}:
let
  cfg = config.modules.hardware.graphics;
in
{
  config = lib.mkIf cfg.amdgpu {
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
        rocmPackages.clr.icd
      ];
    };
    boot.kernelParams = [
      "amdgpu.dpm=1"
    ];

    hardware.amdgpu.initrd.enable = true;
    environment.systemPackages = with pkgs; [
      nvtopPackages.amd
      vulkan-tools
    ];
    users.users.${user}.extraGroups = [
      "video"
      "render"
    ];
  };
}
