{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.hardware.platform;
in
{
  config = lib.mkIf cfg.asusctl {
    services.asusd = {
      enable = true;
      package = pkgs.asusctl;
      enableUserService = true;
    };
    services.supergfxd.enable = false;
  };
}
