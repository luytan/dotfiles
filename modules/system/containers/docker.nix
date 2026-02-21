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
  config = lib.mkIf cfg.docker {
    virtualisation = {
      containers.enable = true;
      docker = {
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
    };
    users.users.luytan.extraGroups = [ "docker" ];
    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };
}
