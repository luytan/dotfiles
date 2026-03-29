{ osConfig, pkgs, lib, ... }:
{
  imports = lib.optionals (osConfig.modules.desktop.hyprland.shell == "caelestia") [
    ./general.nix
    ./variable.nix
    ./animations.nix
    ./decoration.nix
    ./env.nix
    ./execs.nix
    ./gestures.nix
    ./group.nix
    ./input.nix
    ./keybinds.nix
    ./misc.nix
    ./rules.nix
    ./scrolling.nix
    ./wsaction.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = pkgs.xdg-desktop-portal-hyprland ;
    systemd.enable = true;
  };
}
