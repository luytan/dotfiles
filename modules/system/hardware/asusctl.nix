{ config, lib, pkgs-unstable, ... }:
let
  cfg = config.modules.hardware.asusctl;
in
{
  options.modules.hardware.asusctl.enable = lib.mkEnableOption "asusctl";

  config = lib.mkIf cfg.enable {
    services.asusd = {
      enable = true;
      package = pkgs-unstable.asusctl;
      enableUserService = true;
    };
    services.supergfxd.enable = false;
  };
}