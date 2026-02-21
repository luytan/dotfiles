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
  config = lib.mkIf cfg.snapper {
    services.snapper = {
      configs.home = {
        SUBVOLUME = "/home";
        ALLOW_USERS = [ "luytan" ];
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
        TIMELINE_LIMIT_HOURLY = "10";
        TIMELINE_LIMIT_DAILY = "10";
        TIMELINE_LIMIT_WEEKLY = "5";
        TIMELINE_LIMIT_MONTHLY = "1";
      };
    };
    environment.systemPackages = with pkgs; [
      btrfs-assistant
    ];
  };
}
