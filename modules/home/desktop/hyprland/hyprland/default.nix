{ osConfig, pkgs, ... }:
let
  cfg = osConfig.modules.desktop.hyprland;
in
{
  imports =
    if cfg.shell == "caelestia" then
      [ ./caelestia ]
    else if cfg.shell == "illogical" then
      [ ./illogical ]
    else
      [ ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    systemd.enable = true;
  };
}
