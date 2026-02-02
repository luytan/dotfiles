{ config, lib, pkgs, ... }:
let
  cfg = config.modules.containers.podman;
in
{
  options.modules.containers.podman.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf cfg.enable {
    virtualisation.containers.enable = true;
    virtualisation = {
      podman = {
        enable = true;
        dockerCompat = false;
        defaultNetwork.settings.dns_enabled = true;
      };
    };

    environment.systemPackages = with pkgs; [
      dive
      podman-tui
      docker-compose
      distrobox
      podman-compose
      podman-desktop
    ];
  };
}
