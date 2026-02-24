{ lib, osConfig ? {}, ... }:

let
  isWsl = osConfig.wsl.enable or false;
in
{
  imports = [
    ./cyber
    ./dev
    ./cli
    ./sysadmin
    ./ai
  ] ++ lib.optionals (!isWsl) [
    ./gaming
    ./desktop
    ./apps
  ];
}
