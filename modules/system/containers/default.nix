{ lib, config, ... }:
with lib;
{
  options.modules.containers = {
    docker = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Docker";
    };
    podman = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Podman";
    };
    waydroid = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Waydroid";
    };
  };

  imports = [
    ./podman.nix
    ./docker.nix
    ./waydroid.nix
  ];

  config = {
    assertions = [
      {
        assertion = !(config.modules.containers.docker && config.modules.containers.podman);
        message = "modules.containers.docker and modules.containers.podman are mutually exclusive. Select one runtime per host.";
      }
    ];
  };
}
