{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.desktop;
in
{
  imports = [ ./pkgs ];
  config = lib.mkIf cfg.plasma {
    nixos.pkgs.wallpaper-engine-kde-plugin.enable = lib.mkDefault true;
    environment.systemPackages = [
      (pkgs.catppuccin-kde.override {
        flavour = [ "macchiato" ];
        accents = [ "mauve" ];
      })
    ];
    services.desktopManager.plasma6.enable = true;
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.kdePackages.xdg-desktop-portal-kde
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };
}
