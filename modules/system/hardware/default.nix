{ ... }:
{
  imports = [
    ./amdgpu.nix
    ./asusctl.nix
    ./audio.nix
    ./network.nix
    ./quadcast.nix
    ./razer.nix
    ./zram.nix
    ./intel.nix
    ./fingerprint.nix
  ];
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    sessionVariables.ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };
}
