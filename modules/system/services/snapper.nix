{ config, lib, pkgs, ... }:
let
  cfg = config.modules.services.snapper;
in
{
  options.modules.services.snapper.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf cfg.enable {
    services.snapper = {
      configs.home = {
        SUBVOLUME = "/home";
        # Allow your user to manage snapshots (optional)
        ALLOW_USERS = [ "luytan" ];
        # Enable automatic hourly snapshots
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
        # Retention policy
        TIMELINE_LIMIT_HOURLY = "10";
        TIMELINE_LIMIT_DAILY = "10";
        TIMELINE_LIMIT_WEEKLY = "5";
        TIMELINE_LIMIT_MONTHLY = "0";
      };
    };
    environment.systemPackages = with pkgs; [
      btrfs-assistant
    ];
  };
}
