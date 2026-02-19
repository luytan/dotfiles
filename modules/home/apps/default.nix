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
    ./zen-browser.nix
  ];
}
