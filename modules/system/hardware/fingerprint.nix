{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.hardware.fingerprint;
in
{
  options.modules.hardware.fingerprint.enable = lib.mkEnableOption "fingerprint";

  config = lib.mkIf cfg.enable {
    services.fprintd.enable = true;

  };
}
