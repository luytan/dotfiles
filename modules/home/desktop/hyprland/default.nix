{ osConfig, lib, ... }:

{
  imports = lib.optionals (osConfig.modules.desktop.hyprland.enable or false) [
    ./hyprland
    ./shell
  ];
}
