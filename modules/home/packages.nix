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
  ];
}
