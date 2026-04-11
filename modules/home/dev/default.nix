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
    act
    opencode
  ];
  imports = [
  ]
  ++ lib.optionals (!isWsl) [
    ./editors
  ];
}
