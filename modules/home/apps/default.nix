{ pkgs, ... }:

{
  home.packages = with pkgs; [
    obsidian
    mission-center
    filen-desktop
    mpv
    kdePackages.filelight
    brave
    vlc
  ];
  imports = [
    ./alacritty.nix
    ./zen-browser.nix
    ./ghostty.nix
    ./wine.nix
  ];
}
