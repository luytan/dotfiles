{
  lib,
  pkgs,
  inputs,
  ...
}:
let
  systemPackages = lib.attrByPath [ pkgs.stdenv.hostPlatform.system ] { } inputs.niri-scratchpad-flake.packages;
  niriScratchpadPackage =
    if systemPackages ? default && lib.isDerivation systemPackages.default then
      systemPackages.default
    else if systemPackages ? niri-scratchpad && lib.isDerivation systemPackages.niri-scratchpad then
      systemPackages.niri-scratchpad
    else
      null;
in
{
  home.packages = lib.optionals (niriScratchpadPackage != null) [ niriScratchpadPackage ];
}
