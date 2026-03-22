{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.hardware;
in
{
  config = lib.mkIf cfg.audio {
    services.pipewire = {
      enable = true;
      wireplumber.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    environment.systemPackages = with pkgs; [
      easyeffects
    ];
  };
}
