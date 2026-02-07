{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.hardware.intelgpu;
in
{
  options.modules.hardware.intelgpu.enable = lib.mkEnableOption "intelgpu";

  config = lib.mkIf cfg.enable {
    # XServer / generic video driver
    services.xserver.videoDrivers = [ "modesetting" ];
    hardware.enableRedistributableFirmware = true;
    boot.kernelParams = [
      "i915.enable_guc=3"
      "i915.enable_psr=1"
    ];
    # Graphics drivers and extra packages
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver # VA-API (iHD) userspace
        vpl-gpu-rt # oneVPL (QSV) runtime
        intel-compute-runtime # OpenCL (NEO) + Level Zero for Arc/Xe
        intel-vaapi-driver
      ];
    };
    users.users.luytan.extraGroups = [ "video" "render" ];
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
