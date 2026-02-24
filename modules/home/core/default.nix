{
  pkgs,
  lib,
  osConfig ? {},
  ...
}:

let
  isWsl = osConfig.wsl.enable or false;
in
{
  imports = lib.optionals (!isWsl) [
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
    btop
    htop
    nvtopPackages.full
    efibootmgr
    pwgen
    lsof
    yubikey-manager
    nixfmt-tree
    unrar-free
  ] ++ lib.optionals (!isWsl) [
    wl-clipboard
    mpv
    kdePackages.filelight
  ];
}
