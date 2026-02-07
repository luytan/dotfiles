{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.modules.desktop;
in
{
  config = lib.mkIf cfg.plasma {
    services.displayManager.sddm = {
      enable = true;
      wayland = {
        compositor = "kwin";
        enable = true;
      };
      theme = "catppuccin-mocha-mauve";
    };
    environment.systemPackages = [
      (pkgs.catppuccin-sddm.override {
        flavor = "mocha";
        accent = "mauve";
      })
      (pkgs.catppuccin-kde.override {
        flavour = [ "macchiato" ];
        accents = [ "mauve" ];
      })
    ];
    services.desktopManager.plasma6.enable = true;

    # thunar
    programs.thunar.enable = true;
    programs.thunar.plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
    services.gvfs.enable = true;
    services.tumbler.enable = true;
  };
}
