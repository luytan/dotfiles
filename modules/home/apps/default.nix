{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    obsidian
    mission-center
    filen-desktop
    mpv
    kdePackages.filelight
    brave
    vlc
    inputs.rusic.packages.${system}.default
  ];
  imports = [
    ./alacritty.nix
    ./zen-browser.nix
    ./ghostty.nix
    ./wine.nix
  ];
}
