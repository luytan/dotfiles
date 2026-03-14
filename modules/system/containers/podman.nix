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
  config = lib.mkIf cfg.podman {
    virtualisation = {
      containers.enable = true;
      podman = {
        enable = true;
        dockerCompat = false;
        defaultNetwork.settings.dns_enabled = true;
      };
    };

    environment.systemPackages = with pkgs; [
      dive
      podman-tui
      distrobox
      podman-compose
      podman-desktop
      distroshelf
    ];
  };
}
