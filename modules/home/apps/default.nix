{ pkgs, ... }:

{
  home.packages = with pkgs; [
    obsidian
    mission-center
    filen-desktop
    mpv
    kdePackages.filelight
  ];
  imports = [
    ./zen-browser.nix
    ./ghostty.nix
    ./wine.nix
  ];
}
