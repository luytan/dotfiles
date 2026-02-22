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
    services.desktopManager.plasma6 = {
      enable = true;
    };
    services.displayManager.defaultSession = "plasma";
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      kwin-x11
      discover
    ];
    services.displayManager.plasma-login-manager.enable = true;
  };
}
