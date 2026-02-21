{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.hardware.peripherals;
in
{
  config = lib.mkIf cfg.razer {
    hardware.openrazer.enable = true;
    environment.systemPackages = with pkgs; [
      openrazer-daemon
      polychromatic
    ];
    users.users.luytan = {
      extraGroups = [ "openrazer" ];
    };
  };
}
