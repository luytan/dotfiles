{ pkgs, ... }:
{
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
}
