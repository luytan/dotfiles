{ config, lib, ... }:
let
  cfg = config.modules.hardware.zram;
in
{
  options.modules.hardware.zram.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf cfg.enable {
    zramSwap = {
      enable = true;
      algorithm = "zstd";
    };
  };
}
