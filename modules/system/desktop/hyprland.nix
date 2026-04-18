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
  config = lib.mkIf cfg.hyprland.enable {
    programs.hyprland = {
      enable = true;
      withUWSM = false;
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
      gcr
      kdePackages.ark
      ddcutil
    ];
    # Thunar
    programs.thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };

    programs.xfconf.enable = true;
    services.gvfs.enable = true;
    services.tumbler.enable = true;
    # Gnome keyring
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.hyprland.enableGnomeKeyring = true;
    # UWSM Var
    environment = {
      sessionVariables.APP2UNIT_SLICES = "a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice";
    };
    fonts.packages = with pkgs; [
      rubik
      nerd-fonts.ubuntu
      nerd-fonts.jetbrains-mono
    ];
  };
}
