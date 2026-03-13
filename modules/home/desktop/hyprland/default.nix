{ osConfig, lib, ... }:

{
  imports = lib.optionals (osConfig.modules.desktop.hyprland or false) [
    ./hyprland
    ./caelestia.nix
  ];
}
