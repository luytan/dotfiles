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
}
