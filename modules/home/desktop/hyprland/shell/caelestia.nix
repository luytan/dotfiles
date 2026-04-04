{
  config,
  pkgs,
  inputs,
  lib,
  osConfig,
  ...
}:
let
  cfg = osConfig.modules.desktop;
in
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];
  config = lib.mkIf (cfg.hyprland.enable && cfg.hyprland.shell == "caelestia") {
    home.packages = with pkgs; [
      brightnessctl
      ddcutil
      lm_sensors
      swappy
      libqalculate
      material-symbols
      pavucontrol
      rubik
      thunar
      cliphist
      adw-gtk3
      papirus-icon-theme
      qtengine
      libsForQt5.qt5ct
      kdePackages.qt6ct
      libsForQt5.qtstyleplugin-kvantum
      qt6Packages.qtstyleplugin-kvantum
      nerd-fonts.jetbrains-mono
    ];
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
    gtk = {
      enable = true;

      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };

      gtk4.theme = config.gtk.theme;

      #iconTheme = {
      #  name = "Papirus-Dark";
      #  package = pkgs.papirus-icon-theme;
      #};

      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };

      gtk4.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
    home.sessionVariables.GTK_THEME = "adw-gtk3-dark";
    qt = {
      enable = true;
      platformTheme.name = "qtengine";
    };
    programs.caelestia = {
      enable = true;
      systemd = {
        enable = true;
        target = "hyprland-session.target";
      };
      settings = {
        # General apps configuration
        general = {
          apps = {
            terminal = [ "alacritty" ];
            audio = [ "pavucontrol" ];
            explorer = [ "thunar" ];
          };
        };
        bar = {
          persistent = true;
          showOnHover = true;
          status = {
            showBattery = true;
            showBluetooth = true;
            showNetwork = true;
            showAudio = false;
            showKbLayout = false;
          };
          workspaces = {
            shown = 5;
            perMonitorWorkspaces = true;
            showWindows = true;
            activeIndicator = true;
            #activeLabel = "󰮯";
            activeTrail = false;
            label = "  ";
            occupiedBg = false;
            #occupiedLabel = "󰮯";
          };
          clock = {
            showIcon = true;
          };
          tray = {
            background = false;
            recolour = false;
          };
        };

        # Launcher configuration
        launcher = {
          enabled = true;
          maxShown = 8;
          maxWallpapers = 9;
          vimKeybinds = false;
          enableDangerousActions = false;
          actionPrefix = ">";
          specialPrefix = "@";
          showOnHover = false;
          useFuzzy = {
            apps = false;
            actions = false;
            schemes = false;
            variants = false;
            wallpapers = false;
          };
        };

        # Dashboard configuration
        dashboard = {
          enabled = true;
          showOnHover = true;
          mediaUpdateInterval = 500;
        };

        # Border/appearance
        border = {
          rounding = 20;
          thickness = 8;
        };

        # Appearance settings
        appearance = {
          font = {
            family = {
              sans = "Rubik";
              mono = "CaskaydiaCove NF";
              material = "Material Symbols Rounded";
            };
            size = {
              scale = 1;
            };
          };
          anim = {
            durations = {
              scale = 1;
            };
          };
          padding = {
            scale = 1;
          };
          rounding = {
            scale = 1;
          };
          spacing = {
            scale = 1;
          };
          transparency = {
            enabled = false;
            base = 0.85;
            layers = 0.4;
          };
        };

        # Background settings
        background = {
          enabled = true;
          desktopClock = {
            enabled = false;
          };
          visualiser = {
            enabled = false;
            autoHide = true;
            rounding = 1;
            spacing = 1;
          };
        };

        # OSD settings
        osd = {
          enabled = true;
          enableBrightness = true;
          enableMicrophone = false;
          hideDelay = 2000;
        };

        # Notification settings
        notifs = {
          expire = true;
          defaultExpireTimeout = 5000;
          actionOnClick = true;
          clearThreshold = 0.3;
          expandThreshold = 20;
        };

        # Lock screen
        lock = {
          recolourLogo = false;
        };

        # Idle
        idle = {
          lockBeforeSleep = false;
          inhibitWhenAudio = true;
        };
        # Services
        services = {
          audioIncrement = 0.1;
          defaultPlayer = "zen-beta";
          gpuType = "";
          weatherLocation = "";
          useFahrenheit = false;
          useFahrenheitPerformance = false;
          useTwelveHourClock = false;
          smartScheme = true;
          visualiserBars = 45;
        };
      };

      cli = {
        enable = true;
        settings = {
          theme = {
            enableGtk = true;
          };
        };
      };
    };
  };
}
