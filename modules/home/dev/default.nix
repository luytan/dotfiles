{ pkgs, ... }:

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
    ./jetbrain.nix
    ./editors
    ./languages
  ];
}
