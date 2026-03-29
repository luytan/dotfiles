{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.services;
  amdgpuEnabled = config.modules.hardware.graphics.amdgpu;
in
{
  config = lib.mkMerge [
    (lib.mkIf cfg.lact {
      assertions = [
        {
          assertion = amdgpuEnabled;
          message = "modules.services.lact requires modules.hardware.graphics.amdgpu = true.";
        }
      ];
    })
    (lib.mkIf (cfg.lact && amdgpuEnabled) {
      environment.systemPackages = with pkgs; [ lact ];
      systemd.packages = with pkgs; [ lact ];
      systemd.services.lactd.wantedBy = [ "multi-user.target" ];
      hardware.amdgpu.overdrive.enable = true;
    })
  ];
}
