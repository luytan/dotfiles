{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.containers;
in
{
  config = lib.mkIf cfg.waydroid {
    virtualisation = {
      waydroid.enable = true;
    };

    environment.systemPackages = with pkgs; [
    ];
  };
}
