{
  config,
  lib,
  user,
  ...
}:
let
  cfg = config.modules.services;
in
{
  config = lib.mkIf cfg.nh {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 5";
      flake = "/home/${user}/Documents/NixOS/dotfiles";
    };
  };
}
