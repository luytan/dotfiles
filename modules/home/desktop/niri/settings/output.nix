{
  config,
  lib,
  pkgs,
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
          focus-at-startup = true;
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
      };
    };
  };
}
