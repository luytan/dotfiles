{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
  nix.settings.allowed-users = [ "@wheel" ];
  nix.settings.trusted-users = [ "luytan" "@wheel" ];
  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.package = inputs.determinate.packages.${pkgs.stdenv.hostPlatform.system}.default;
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    lazy-trees = true;
    eval-cores = 0;
    extra-substituters = [
      "https://lanzaboote.cachix.org"
      "https://vicinae.cachix.org"
      "https://cache.flakehub.com"
    ];
    extra-trusted-public-keys = [
      "lanzaboote.cachix.org-1:Nt9//zGmqkg1k5iu+B3bkj3OmHKjSw9pvf3faffLLNk="
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
      "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
    ];
  };

}
