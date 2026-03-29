{ osConfig, lib, ... }:

{
  imports = lib.optionals (osConfig.modules.desktop.niri.enable or false) [
    ./niri.nix
    ./scratchpad.nix
    ./shell
  ];
}
