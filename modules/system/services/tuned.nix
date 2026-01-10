{ config, lib, pkgs, ... }:
let
  cfg = config.modules.services.tuned;
in
{
  options.modules.services.tuned.enable = lib.mkEnableOption "tuned";

  config = lib.mkIf cfg.enable {
    services.tuned = {
      enable = true;

      settings = {
        daemon = true;
        dynamic_tuning = true;
        sleep_interval = 1;
        update_interval = 10;
        recommend_command = true;
        reapply_sysctl = true;
        default_instance_priority = 0;
      };

      ppdSupport = true;

      ppdSettings = {
        main = {
          default = "balanced";
          battery_detection = true;
        };

        profiles = {
          balanced = "balanced";
          performance = "throughput-performance";
          power-saver = "powersave";
        };

        battery = {
          balanced = "balanced-battery";
        };
      };
    };
  };
}
