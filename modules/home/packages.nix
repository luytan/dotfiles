{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Dev
    code-cursor
    jdk
    jq
    lstr
    fastfetch
    ghidra-bin
    gcc
    gdb
    rsync
    bat
    tldr
    yazi
    fzf
    ripgrep
    neovim
    nixfmt
    nil
    nixd
    rustc
    cargo
    file
    python3
    ansible
    kubectl
    k9s
    helm
    terraform

    # Utils
    efibootmgr
    unzip
    wl-clipboard
    btop
    htop
    eza
    nvtopPackages.full

    # GUI
    mangohud
    obsidian
    mission-center
    filen-desktop
    freelens-bin
  ];
}
