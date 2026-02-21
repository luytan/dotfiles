{ lib, ... }:
with lib;
{
  options.modules.hardware.platform = {
    asusctl = mkOption {
      type = types.bool;
      default = false;
      description = "Enable ASUS laptop specific controls";
    };
  };

  imports = [
    ./asusctl.nix
  ];
}
