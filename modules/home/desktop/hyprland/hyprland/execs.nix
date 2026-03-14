{ lib, pkgs, ... }:
with lib;
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # Keyring and Auth
      "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start --components=secrets"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"

      # Clipboard History
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"

      # Cursors
      "hyprctl setcursor $cursorTheme $cursorSize"
      "gsettings set org.gnome.desktop.interface cursor-theme '$cursorTheme'"
      "gsettings set org.gnome.desktop.interface cursor-size $cursorSize"

      # Night light
      "sleep 1 && gammastep"
      # Media
      "mpris-proxy"


    ];

    # Commands that run on reload too
    exec = [
      "hyprctl dispatch submap global"
    ];
  };
}
