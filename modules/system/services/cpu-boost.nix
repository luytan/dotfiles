{ config, lib, pkgs, ... }:
let
  cfg = config.modules.services.cpu-boost;
in
{
  options.modules.services.cpu-boost.enable = lib.mkEnableOption "cpu-boost";

  config = lib.mkIf cfg.enable {
    # I hate cpu boost
    systemd.services.force-disable-boost = {
      description = "Force disable CPU Boost";
    after = [ "tuned.service" "multi-user.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
    script = ''
      if [ -f /sys/devices/system/cpu/cpufreq/boost ]; then
        echo 0 > /sys/devices/system/cpu/cpufreq/boost
      fi
      
      if [ -f /sys/devices/system/cpu/intel_pstate/no_turbo ]; then
        echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo
      fi
    '';
  };
  };
}