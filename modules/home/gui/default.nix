{ pkgs, ... }:

{
  imports = [
    ./vicinae.nix
  ];
  home.packages = with pkgs; [
    mangohud
    obsidian
    mission-center
    filen-desktop
  ];
}
