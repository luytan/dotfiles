{ config, lib, ... }:
let
  cfg = config.modules.services.nh;
in
{
  options.modules.services.nh.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf cfg.enable {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/luytan/Documents/NixOS/dotfiles"; # sets NH_OS_FLAKE variable for you
    };
  };
}
