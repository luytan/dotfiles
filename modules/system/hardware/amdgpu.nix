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
    boot.kernelParams = [
      "amdgpu.dpm=1" # Enable dynamic power management
      "pcie_aspm=force" # Force PCIe Active State Power Management
    ];
    
    # Force the AMD GPU to auto-suspend
    services.udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x73ef", ATTR{power/control}="auto"
      ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0xab28", ATTR{power/control}="auto"
    '';

    hardware.amdgpu.initrd.enable = true;
  };
}
