{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jdk
    python3
    gcc
    gdb
    gnumake
    cmake
    ansible
    kubectl
    k9s
    helm
    nixfmt
    nil
    nixd
    jq
    lstr
    neovim
  ];
    imports = [
    ./jetbrain.nix
    ./rust.nix
  ];
}
