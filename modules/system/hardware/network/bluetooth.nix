{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.hardware.network;
in
{
  config = lib.mkIf cfg.bluetooth {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };
    environment.systemPackages = with pkgs; [
      overskride
    ];
  };
}
