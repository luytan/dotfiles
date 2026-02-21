{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.cli;
in
{
  options.modules.cli = {
  };

  imports = [
    ./eza.nix
    ./fish.nix
    ./ghostty.nix
    ./git.nix
    ./gpg.nix
    ./zellij.nix
    ./zoxide.nix
    ./fastfetch.nix
  ];
}
