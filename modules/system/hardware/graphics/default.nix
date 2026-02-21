{ lib, ... }:
with lib;
{
  options.modules.hardware.graphics = {
    amdgpu = mkOption {
      type = types.bool;
      default = false;
      description = "Enable AMDGPU support";
    };
    intel = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Intel graphics support";
    };
  };

  imports = [
    ./amdgpu.nix
    ./intel.nix
  ];
}
