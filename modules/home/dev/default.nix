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
    jdk
    jq
    lstr
  ];
  imports = [
  ]
  ++ lib.optionals (!isWsl) [
    ./editors
  ];
}
