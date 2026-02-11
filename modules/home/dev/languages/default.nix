{ pkgs, ... }:

{
  imports = [
    ./rust.nix
    ./nix.nix
    ./cpp.nix
  ];
  home.packages = with pkgs; [
    jdk
    python3
    cmake
    neovim
    perl
  ];
}
