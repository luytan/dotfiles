{ pkgs, ... }:

{
  home.packages = with pkgs; [
    github-copilot-cli
  ];
  imports = [
    ./lm-studio.nix
    ./gemini.nix
  ];
}
