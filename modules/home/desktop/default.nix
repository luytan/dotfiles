{ pkgs, ... }:

{
  imports = [
    ./ghostty.nix
    ./vicinae.nix
    ./niri
  ];
}
