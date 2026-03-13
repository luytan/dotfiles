{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl
    thunar
    cliphist
    adw-gtk3
    papirus-icon-theme
    qtengine
  ];
}
