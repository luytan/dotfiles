{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
let
  cfg = config.modules.desktop;
  niriInstance = lib.getExe (
    pkgs.writeShellScriptBin "niri-instance" ''
      /run/current-system/sw/bin/niri --session
    ''
  );

in
{
  config = lib.mkIf cfg.niri {
    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    app2unit
    xdg-terminal-exec
    playerctl
  ];
    programs.uwsm = {
      enable = true;
      package = pkgs.uwsm;
      waylandCompositors = {
        niri = {
          prettyName = "Niri";
          comment = "Niri compositor managed by UWSM";
          binPath = niriInstance;
        };
      };
    };
  };
}
