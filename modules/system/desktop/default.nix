{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.desktop;
in
{
  options.modules.desktop = {
    plasma = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Plasma desktop environment";
    };
    niri = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Niri compositor";
    };
  };

  imports = [
    ./plasma.nix
    ./niri.nix
    ./sddm.nix
  ];

  config = {
    environment = {
      sessionVariables.NIXOS_OZONE_WL = "1";
      sessionVariables.ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    };
  };
}
