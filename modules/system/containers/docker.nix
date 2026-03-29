{
  config,
  lib,
  pkgs,
  user,
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
        enable = true;
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
    users.users.${user}.extraGroups = [ "docker" ];
    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };
}
