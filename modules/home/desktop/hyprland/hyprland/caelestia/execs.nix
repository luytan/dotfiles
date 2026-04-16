{ lib, pkgs, ... }:
with lib;
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # Keep session env in systemd user services (soteria/polkit compatibility)
      "${pkgs.dbus}/bin/dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_ID"

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
