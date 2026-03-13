{ pkgs, ... }:

{
  imports = [
    #./vicinae.nix
    ./niri
    ./hyprland
  ];
}
