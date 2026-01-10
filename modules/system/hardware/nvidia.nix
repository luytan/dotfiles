{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.hardware.nvidia;
in
{
  options.modules.hardware.nvidia.enable = lib.mkEnableOption "nvidia";

  config = lib.mkIf cfg.enable {
    # Enable OpenGL
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
    };

    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    environment.systemPackages = with pkgs; [
      libva-vdpau-driver
      libvdpau-va-gl
      libva
      libva-utils
    ];
    environment.variables = {
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      MOZ_DISABLE_RDD_SANDBOX = "1";
      LIBVA_DRIVER_NAME = "nvidia";
    };
      boot.blacklistedKernelModules = [
      "nouveau"
      "nova"
      "nova_core"
      "nova-drm"
    ];
  };
}
