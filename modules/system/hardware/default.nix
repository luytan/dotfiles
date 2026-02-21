{ lib, ... }:
with lib;
{
  options.modules.hardware = {
    audio = mkOption {
      type = types.bool;
      default = true;
    };
  };

  imports = [
    ./audio.nix
    ./graphics
    ./network
    ./peripherals
    ./platform
  ];
}
