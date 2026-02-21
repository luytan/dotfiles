{ lib, ... }:
with lib;
{
  options.modules.hardware.peripherals = {
    quadcast = mkOption {
      type = types.bool;
      default = false;
      description = "Enable HyperX QuadCast RGB control";
    };
    razer = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Razer control";
    };
    fingerprint = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Fingerprint reader support";
    };
  };

  imports = [
    ./quadcast.nix
    ./razer.nix
    ./fingerprint.nix
  ];
}
