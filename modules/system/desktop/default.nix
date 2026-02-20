{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.desktop;
in
{
  options.modules.desktop = {
    plasma = mkEnableOption "plasma";
    niri = mkEnableOption "niri";
  };

  imports = [
    ./plasma.nix
    ./niri.nix
    ./pkgs
  ];
}
