{ pkgs, inputs, osConfig ? {}, ... }:
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
    ./caelestia-dots
  ];

  programs.caelestia = {
    enable = true;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
      #environment = [ "QSG_RENDER_LOOP=basic" ];
    };
    settings = {
      # General apps configuration
      general = {
        excludedScreens = if (osConfig.networking.hostName or "") == "sylveon" then [ "^(?!DP-2$).*$" ] else [ ];
        apps = {
          terminal = [ "ghostty" ];
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
        expire = false;
        defaultExpireTimeout = 5000;
        actionOnClick = false;
        clearThreshold = 0.3;
        expandThreshold = 20;
      };

      # Lock screen
      lock = {
        recolourLogo = false;
      };

      # Session menu
      session = {
        vimKeybinds = false;
        dragThreshold = 30;
        commands = {
          logout = [
            "loginctl"
            "terminate-user"
            ""
          ];
          shutdown = [
            "systemctl"
            "poweroff"
          ];
          hibernate = [
            "systemctl"
            "hibernate"
          ];
          reboot = [
            "systemctl"
            "reboot"
          ];
        };
      };

      # Services
      services = {
        audioIncrement = 0.1;
        defaultPlayer = "zen-beta";
        gpuType = "";
        weatherLocation = "";
        useFahrenheit = false;
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
}
