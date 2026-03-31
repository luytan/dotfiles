{ lib, osConfig, ... }:
with lib;
{
  wayland.windowManager.hyprland.settings = {
    # Monitor Configuration
    monitor =
      if osConfig.networking.hostName == "glaceon" then
        [
          "desc:Thermotrex Corporation TL140ADXP01, 2560x1600@120, 0x0, 1.25, vrr, 1, bitdepth, 10, cm, auto"
          ", preferred, auto, 1"
        ]
      else
        [
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
    xwayland = {
      force_zero_scaling = true;
    };
    # Dwindle Layout
    dwindle = {
      preserve_split = true;
      smart_split = false;
      smart_resizing = true;
    };
  };
}
