{ pkgs, ... }:

{
  home.packages = with pkgs; [
    obsidian
    mission-center
    filen-desktop
  ];
  imports = [
    ./zen-browser.nix
  ];
}
