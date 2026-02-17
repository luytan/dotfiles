{ osConfig, lib, ... }:

{
  imports = lib.optionals (osConfig.modules.desktop.niri or false) [
    ./niri.nix
    ./noctalia.nix
  ];
}
