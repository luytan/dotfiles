{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.desktop;
in
{
  options.modules.desktop = {
    plasma = mkEnableOption "plasma";
    #hyprland = mkEnableOption "hyprland";
  };

  imports = [
    ./plasma.nix
    ./pkgs
    #./hyprland.nix
  ];
}
