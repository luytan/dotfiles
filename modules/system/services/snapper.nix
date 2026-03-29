{
  config,
  lib,
  pkgs,
  user,
  ...
}:
let
  cfg = config.modules.services;
in
{
  config = lib.mkMerge [
    (lib.mkIf cfg.snapper {
      assertions = [
        {
          assertion = (config.fileSystems."/home".fsType or null) == "btrfs";
          message = "modules.services.snapper requires /home to use btrfs.";
        }
      ];
    })
    (lib.mkIf (cfg.snapper && ((config.fileSystems."/home".fsType or null) == "btrfs")) {
      services.snapper = {
        configs.home = {
          SUBVOLUME = "/home";
          ALLOW_USERS = [ "${user}" ];
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
    })
  ];
}
