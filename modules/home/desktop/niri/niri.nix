{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./settings
  ];
  home.packages = with pkgs; [
    brightnessctl
    imagemagick
    ddcutil
    cliphist
    cava
    python3
    evolution-data-server
    wlsunset
    nautilus
  ];
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        ignore_dbus_inhibit = true;
        lock_cmd = "noctalia-shell ipc call lockScreen lock";
        before_sleep_cmd = "noctalia-shell ipc call lockScreen lock";
        inhibit_sleep = 1;
      };

      listener = [
        {
          timeout = 900;
          on-timeout = "noctalia-shell ipc call lockScreen lock";
        }
      ];
    };
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "adwaita-dark";
    #style = "-dark";
  };
  programs.niri = {
    settings = {
      spawn-at-startup = [
        {
          command = [
            "${pkgs.dbus}/bin/dbus-update-activation-environment"
            "--systemd"
            "DISPLAY"
            "WAYLAND_DISPLAY"
            "XDG_CURRENT_DESKTOP"
            "XDG_SESSION_ID"
          ];
        }
      ];

      hotkey-overlay.skip-at-startup = true;

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      animations = {
        # slowdown = 3.0;
      };

      window-rules = [
        {
          geometry-corner-radius = {
            top-left = 20.0;
            top-right = 20.0;
            bottom-left = 20.0;
            bottom-right = 20.0;
          };
          clip-to-geometry = true;
        }
        {
          matches = [ { app-id = "^org\\.wezfurlong\\.wezterm$"; } ];
          default-column-width = { };
        }
        {
          matches = [
            {
              app-id = "firefox$";
              title = "^Picture-in-Picture$";
            }
          ];
          open-floating = true;
        }
      ];

      layer-rules = [
        {
          matches = [
            { namespace = "^noctalia-overview.*"; }
          ];
          place-within-backdrop = true;
        }
      ];
    };
  };
}
