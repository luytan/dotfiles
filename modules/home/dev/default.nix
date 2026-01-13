{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jdk
    python3
    gcc
    gdb
    gnumake
    cmake
    rustc
    cargo
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
}
