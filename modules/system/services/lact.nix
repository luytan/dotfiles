{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.services;
in
{
  config = lib.mkIf cfg.lact {
    environment.systemPackages = with pkgs; [ lact ];
    systemd.packages = with pkgs; [ lact ];
    systemd.services.lactd.wantedBy = [ "multi-user.target" ];
    hardware.amdgpu.overdrive.enable = true;
  };
}
