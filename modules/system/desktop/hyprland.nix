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
  config = lib.mkIf cfg.hyprland {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
    };
    environment.systemPackages = with pkgs; [
      hyprpicker
      app2unit
      xdg-terminal-exec
      playerctl
    ];
    environment = {
      sessionVariables.APP2UNIT_SLICES = "a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice";
      sessionVariables.QT_QPA_PLATFORMTHEME = "qtengine";
      sessionVariables.QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      sessionVariables.QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    };
  };
}
