{ lib, osConfig, ... }:
with lib;
let
  isGlaceon = (osConfig.networking.hostName or "") == "glaceon";
in
{
  wayland.windowManager.hyprland.settings = {
    # Monitor Configuration
    monitor = if isGlaceon then [
      # Host-specific laptop panel tuning: scale + VRR + 10-bit output.
      "desc:Thermotrex Corporation TL140ADXP01, 2560x1600@120, 0x0, 1.25, vrr, 1, bitdepth, 10, cm, auto"
      ", preferred, auto, 1"
    ] else [
      ", preferred, auto, 1"
    ];

    # General Settings
    general = {
      layout = "dwindle";
      allow_tearing = false; # Allows `immediate` window rule to work

      gaps_workspaces = "$workspaceGaps";
      gaps_in = "$windowGapsIn";
      gaps_out = "$windowGapsOut";
      border_size = "$windowBorderSize";

      "col.active_border" = "$activeWindowBorderColour";
      "col.inactive_border" = "$inactiveWindowBorderColour";
    };

    # Dwindle Layout
    dwindle = {
      preserve_split = true;
      smart_split = false;
      smart_resizing = true;
    };
  };
}
