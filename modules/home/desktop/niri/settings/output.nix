{
  config,
  lib,
  pkgs,
  osConfig ? null,
  ...
}:

{
  programs.niri = {
    settings = {
      outputs = {
        "DP-1" = {
          mode = {
            width = 2560;
            height = 1440;
            refresh = 244.000;
          };
          variable-refresh-rate = true;
          position = {
            x = 0;
            y = 0;
          };
        };

        "DP-2" = {
          mode = {
            width = 2560;
            height = 1440;
            refresh = 244.000;
          };
          variable-refresh-rate = true;
          position = {
            x = 2560;
            y = 0;
          };
          focus-at-startup = true;
        };

        "DP-3" = {
          mode = {
            width = 2560;
            height = 1440;
            refresh = 244.000;
          };
          variable-refresh-rate = true;
          position = {
            x = 5120;
            y = 0;
          };
        };
      }
      // lib.optionalAttrs (osConfig != null && osConfig.networking.hostName == "glaceon") {
        "eDP-2" = {
          mode = {
            width = 2560;
            height = 1600;
            refresh = 120.000;
          };
          scale = 1.5;
          variable-refresh-rate = true;
          position = {
            x = 0;
            y = 0;
          };
        };
      };
    };
  };
}
