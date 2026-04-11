{ lib, osConfig ? {}, ... }:
with lib;
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # Global Rules
      "opacity $windowOpacity override, match:fullscreen false"
      "opaque true, match:class foot|equibop|org\\.quickshell|imv|swappy|ghostty"
      "center true, match:float true, match:xwayland false"

      # Float Rules
      "float true, match:class guifetch"
      "float true, match:class yad"
      "float true, match:class zenity"
      "float true, match:class wev"
      "float true, match:class org\\.gnome\\.FileRoller"
      "float true, match:class file-roller"
      "float true, match:class blueman-manager"
      "float true, match:class com\\.github\\.GradienceTeam\\.Gradience"
      "float true, match:class feh"
      "float true, match:class imv"
      "float true, match:class system-config-printer"
      "float true, match:class org\\.quickshell"
      "float true, match:class pavucontrol"
      "float true, match:class nm-connection-editor"

      # Float, Resize and Center
      "float true, match:class foot, match:title nmtui"
      "size 60% 70%, match:class foot, match:title nmtui"
      "center 1, match:class foot, match:title nmtui"

      "float true, match:class org\\.gnome\\.Settings"
      "size 70% 80%, match:class org\\.gnome\\.Settings"
      "center 1, match:class org\\.gnome\\.Settings"

      "float true, match:class org\\.pulseaudio\\.pavucontrol|yad-icon-browser"
      "size 60% 70%, match:class org\\.pulseaudio\\.pavucontrol|yad-icon-browser"
      "center 1, match:class org\\.pulseaudio\\.pavucontrol|yad-icon-browser"

      "float true, match:class nwg-look"
      "size 50% 60%, match:class nwg-look"
      "center 1, match:class nwg-look"

      # Special Workspaces
      "workspace special:sysmon, match:class btop"
      "workspace special:music, match:class feishin|Spotify|Supersonic|Cider"
      "workspace special:music, match:initial_title Spotify( Free)?"
      "workspace special:communication, match:class discord|equibop|vesktop|whatsapp"
      "workspace special:todo, match:class Todoist"

      # Dialogs
      "float true, match:title (Select|Open)( a)? (File|Folder)(s)?"
      "float true, match:title File (Operation|Upload)( Progress)?"
      "float true, match:title .* Properties"
      "float true, match:title Export Image as PNG"
      "float true, match:title GIMP Crash Debug"
      "float true, match:title Save As"
      "float true, match:title Library"

      # Picture in Picture
      "move 100%-w-2% 100%-w-3%, match:title Picture(-| )in(-| )[Pp]icture"
      "keep_aspect_ratio true, match:title Picture(-| )in(-| )[Pp]icture"
      "float true, match:title Picture(-| )in(-| )[Pp]icture"
      "pin true, match:title Picture(-| )in(-| )[Pp]icture"

      # Steam
      "rounding 10, match:class steam"
      "float true, match:title Friends List, match:class steam"
      "immediate true, match:class steam_app_[0-9]+"
      "idle_inhibit always, match:class steam_app_[0-9]+"

      # XWayland Popups
      "no_dim true, match:xwayland 1, match:title win[0-9]+"
      "no_shadow true, match:xwayland 1, match:title win[0-9]+"
      "rounding 10, match:xwayland 1, match:title win[0-9]+"
    ];

    # Workspace Rules
    workspace = [
      "w[tv1]s[false], gapsout:$singleWindowGapsOut"
      "f[1]s[false], gapsout:$singleWindowGapsOut"
    ] ++ optionals (osConfig.networking.hostName == "sylveon") [
      "1, monitor:DP-2, default:true"
      "2, monitor:DP-2"
      "3, monitor:DP-2"
      "4, monitor:DP-2"
      "5, monitor:DP-2"
      "6, monitor:DP-2"
      "7, monitor:DP-2"
      "8, monitor:DP-2"
      "9, monitor:DP-2"
      "10, monitor:DP-2"
    ];

    # Layer Rules
    layerrule = [
      # Utilities
      "animation fade, match:namespace hyprpicker"
      "animation fade, match:namespace logout_dialog"
      "animation fade, match:namespace selection"
      "animation fade, match:namespace wayfreeze"

      # Fuzzel Launcher
      "animation popin 80%, match:namespace launcher"
      "blur true, match:namespace launcher"

      # Caelestia Shell
      "no_anim true, match:namespace caelestia-(border-exclusion|area-picker)"
      "animation fade, match:namespace caelestia-(drawers|background)"
    ];
  };
}
