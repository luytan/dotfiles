{ pkgs, ... }:

{
  imports = [
    ./wine.nix
  ];

  home.packages = with pkgs; [
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
    pwgen
    lsof
    yubikey-manager
  ];
}
