{
  pkgs,
  lib,
  osConfig ? { },
  inputs,
  ...
}:

let
  isWsl = osConfig.wsl.enable or false;
in
{
  home.packages = [
    inputs.copilot-cli.packages.x86_64-linux.default
  ];
  imports = [
    ./gemini.nix
  ]
  ++ lib.optionals (!isWsl) [
    ./lm-studio.nix
  ];
}
