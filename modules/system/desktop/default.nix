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
      type = types.submodule {
        options = {
          enable = mkOption {
            type = types.bool;
            default = false;
            description = "Enable Niri Compositor";
          };
          shell = mkOption {
            type = types.enum [
              "noctalia"
            ];
            default = "noctalia";
            description = "Shell to use with Niri";
          };
        };
      };
    };
    hyprland = mkOption {
      type = types.submodule {
        options = {
          enable = mkOption {
            type = types.bool;
            default = false;
            description = "Enable Hyprland Compositor";
          };
          shell = mkOption {
            type = types.enum [
              "caelestia"
              "illogical"
            ];
            default = "illogical";
            description = "Shell to use with Hyprland";
          };
        };
      };
    };
  };

  imports = [
    ./plasma.nix
    ./niri.nix
    ./sddm.nix
    ./hyprland.nix
  ];

  config = {
    environment = {
      sessionVariables.NIXOS_OZONE_WL = "1";
      sessionVariables.ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    };
  };
}
