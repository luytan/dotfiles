{ lib, ... }:
with lib;
{
  options.modules.hardware.network = {
    bluetooth = mkOption {
      type = types.bool;
      default = true;
      description = "Enable Bluetooth support";
    };
    network = mkOption {
      type = types.bool;
      default = true;
      description = "Enable NetworkManager and basic networking configuration";
    };
  };

  imports = [
    ./network.nix
    ./bluetooth.nix
  ];
}
