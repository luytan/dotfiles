{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    bat
    tldr
    yazi
    fzf
    ripgrep
    file
    unzip
    rsync
    wl-clipboard
    btop
    htop
    nvtopPackages.full
    efibootmgr
  ];
}
