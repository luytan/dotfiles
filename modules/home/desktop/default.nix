{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.desktop;
in
{
  options.modules.desktop = {
    hyprland = mkEnableOption "hyprland";
  };

  imports = [
  ];
}
