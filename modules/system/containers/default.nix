{ lib, ... }:
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
  };

  imports = [
    ./podman.nix
    ./docker.nix
  ];
}
