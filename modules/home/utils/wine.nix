{ pkgs-unstable, ... }:

{
  home.packages = with pkgs-unstable; [
    wineWowPackages.waylandFull
    bottles
  ];
}
