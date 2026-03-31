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
  imports = [
    ./eza.nix
    ./fish.nix
    ./git.nix
    ./gpg.nix
    ./zellij.nix
    ./zoxide.nix
    ./fastfetch.nix
    ./archive.nix
    ./irssi.nix
    ./direnv.nix
    ./neovim.nix
  ];
  home.packages =
    with pkgs;
    [
      tldr
      bat
      tldr
      yazi
      fzf
      ripgrep
      file
      rsync
      btop
      htop
      pwgen
      lsof
      vim
      wget
    ]
    ++ lib.optionals (!isWsl) [
      wl-clipboard
    ];
}
