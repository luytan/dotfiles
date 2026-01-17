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
    enable = mkEnableOption "gaming";
    gamescope = mkEnableOption "gamescope";
  };
  config = mkMerge [
    (mkIf cfg.enable {
      programs.steam = {
        enable = true;
      };

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
