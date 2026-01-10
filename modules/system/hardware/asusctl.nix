{ config, lib, ... }:
let
  cfg = config.modules.hardware.asusctl;
in
{
  options.modules.hardware.asusctl.enable = lib.mkEnableOption "asusctl";

  config = lib.mkIf cfg.enable {
    services.asusd = {
      enable = true;
      enableUserService = true;
    };
  };
}