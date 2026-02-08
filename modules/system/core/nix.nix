{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
  nix.settings.allowed-users = [ "@wheel" ];
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
    ];
    trusted-public-keys = [
      "lanzaboote.cachix.org-1:Nt9//zGmqkg1k5iu+B3bkj3OmHKjSw9pvf3faffLLNk="
    ];
  };

}
