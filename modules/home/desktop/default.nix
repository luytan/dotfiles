{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mangohud
    obsidian
    mission-center
    filen-desktop
  ];
    imports = [
    ./discord.nix
    ./vicinae.nix
  ];
}
