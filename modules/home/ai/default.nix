{
  pkgs,
  lib,
  osConfig ? { },
  ...
}:

let
  isWsl = osConfig.wsl.enable or false;
in
{
  home.packages = with pkgs; [
    github-copilot-cli
  ];
  imports = [
    ./gemini.nix
  ]
  ++ lib.optionals (!isWsl) [
    ./lm-studio.nix
  ];
}
