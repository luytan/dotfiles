{
  inputs,
  pkgs,
  lib,
  ...
}:

let
  lmStudioPackage = lib.attrByPath [ pkgs.stdenv.hostPlatform.system "default" ] null inputs.lmstudio.packages;
in
{
  home.packages = lib.optionals (lmStudioPackage != null) [ lmStudioPackage ];
}
