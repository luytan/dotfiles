{ config, lib, pkgs, ... }:
let
  cfg = config.modules.services.lact;
in
{
  options.modules.services.lact.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ lact ];
    systemd.packages = with pkgs; [ lact ];
    systemd.services.lactd.wantedBy = [ "multi-user.target" ];
    hardware.amdgpu.overdrive.enable = true;
  };
}
