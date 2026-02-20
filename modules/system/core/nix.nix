{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [
    inputs.rust-overlay.overlays.default
    inputs.niri.overlays.niri
  ];
  nix.settings.allowed-users = [ "@wheel" ];
  nix.settings.trusted-users = [
    "luytan"
    "@wheel"
  ];
  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    extra-substituters = [
      "https://lanzaboote.cachix.org"
      "https://vicinae.cachix.org"
    ];
    extra-trusted-public-keys = [
      "lanzaboote.cachix.org-1:Nt9//zGmqkg1k5iu+B3bkj3OmHKjSw9pvf3faffLLNk="
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
    ];
  };

}
