{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.gaming;

in
{
  options.modules.gaming = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable gaming-related packages";
    };
    gamescope = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Gamescope compositor support";
    };
  };
  config = mkMerge [
    (mkIf cfg.enable {
      programs.steam = {
        enable = true;
      };
      programs.gamemode.enable = true;
      environment.systemPackages = with pkgs; [
        mangohud
      ];
    })
    (mkIf cfg.gamescope {
      programs.gamescope = {
        enable = true;
        capSysNice = false;
      };
    })
  ];
}
