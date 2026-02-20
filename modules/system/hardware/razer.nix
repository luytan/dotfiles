{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.hardware.razer;
in
{
  options.modules.hardware.razer.enable = lib.mkEnableOption "razer";

  config = lib.mkIf cfg.enable {
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
