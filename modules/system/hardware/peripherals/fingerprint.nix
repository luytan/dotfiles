{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.hardware.peripherals;
in
{
  config = lib.mkIf cfg.fingerprint {
    services.fprintd.enable = true;
  };
}
