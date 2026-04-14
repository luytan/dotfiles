{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
let
  cfg = config.modules.desktop;
in
{
  config = lib.mkIf cfg.niri.enable {
    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
    environment.systemPackages = with pkgs; [
      xwayland-satellite
      app2unit
      xdg-terminal-exec
      playerctl
      kdePackages.qtsvg
      kdePackages.dolphin
      kdePackages.kio
      kdePackages.kio-fuse
      kdePackages.kio-extras
      ddcutil
    ];
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
      ];
    };
  };
}
