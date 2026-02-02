{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.containers.docker;
in
{
  options.modules.containers.docker.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf cfg.enable {
    virtualisation.containers.enable = true;
    virtualisation.docker = {
      enable = false;

      rootless = {
        enable = true;
        setSocketVariable = true;
        daemon.settings = {
          dns = [
            "1.1.1.1"
            "1.0.0.1"
          ];
          registry-mirrors = [ "https://mirror.gcr.io" ];
        };
      };
    };
    users.users.luytan.extraGroups = [ "docker" ];
    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };
}
