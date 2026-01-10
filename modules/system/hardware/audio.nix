{ config, lib, pkgs, ... }:
let
  cfg = config.modules.hardware.audio;
in
{
  options.modules.hardware.audio.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf cfg.enable {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };
    environment.systemPackages = with pkgs; [
      easyeffects
    ];
    security.rtkit.enable = true;
  };
}
