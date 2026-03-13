{ osConfig, lib, ... }:

{
  imports = lib.optionals (osConfig.modules.desktop.hyprland or false) [
    #./hyprland.nix
    ./caelestia.nix
  ];
}
