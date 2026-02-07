{ ... }:
{
  imports = [
    ./amdgpu.nix
    ./intel.nix
  ];
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    sessionVariables.ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };
}
