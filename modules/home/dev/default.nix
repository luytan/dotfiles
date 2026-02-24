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
    python3
    gnumake
    cmake
    python313Packages.pkgconfig
    jq
    lstr
    neovim
  ];
  imports = [
    ./languages
  ]
  ++ lib.optionals (!isWsl) [
    ./jetbrain.nix
    ./editors
  ];
}
