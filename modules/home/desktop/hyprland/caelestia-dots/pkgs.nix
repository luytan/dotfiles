{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl
    ddcutil
    lm_sensors
    swappy
    libqalculate
    material-symbols
    pavucontrol
    rubik
    thunar
    cliphist
    adw-gtk3
    papirus-icon-theme
    qtengine
  ];
}
