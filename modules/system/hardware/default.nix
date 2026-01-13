{ ... }:
{
  imports = [
    ./asusctl.nix
    ./audio.nix
    ./network.nix
    ./nvidia.nix
    ./quadcast.nix
    ./razer.nix
    ./zram.nix
  ];
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    sessionVariables.ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };
}
