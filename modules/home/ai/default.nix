{ pkgs, ... }:

{
  home.packages = with pkgs; [
  ];
  imports = [
    ./lm-studio.nix
    ./gemini.nix
  ];
}
