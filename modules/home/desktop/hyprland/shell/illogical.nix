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
    programs.illogical-impulse.enable = true;
  };
}
