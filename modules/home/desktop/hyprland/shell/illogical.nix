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
    inputs.illogical-flake.homeManagerModules.default
  ];
  config = lib.mkIf (cfg.hyprland.enable && cfg.hyprland.shell == "illogical") {
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
      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
      gtk4.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
      gtk4.theme = config.gtk.theme;
    };
    home.sessionVariables.GTK_THEME = "Adwaita-dark";
    qt = {
      enable = true;
      platformTheme.name = "adwaita-dark";
    };
    programs.illogical-impulse.enable = true;
    xdg.portal.config = lib.mkForce { };
  };
}
