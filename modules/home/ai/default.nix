{
  pkgs,
  lib,
  osConfig ? { },
  inputs,
  ...
}:

let
  isWsl = osConfig.wsl.enable or false;
  copilotCliPackage = lib.attrByPath [
    pkgs.stdenv.hostPlatform.system
    "default"
  ] null inputs.copilot-cli.packages;
in
{
  home.packages = lib.optionals (copilotCliPackage != null) [ copilotCliPackage ];
  imports = [
    ./gemini.nix
  ]
  ++ lib.optionals (!isWsl) [
    ./lm-studio.nix
  ];
}
