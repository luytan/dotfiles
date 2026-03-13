{
  inputs,
  pkgs,
  user,
  ...
}:
{
  nixpkgs.overlays = [
    inputs.rust-overlay.overlays.default
    inputs.niri.overlays.niri
    inputs.nix-vscode-extensions.overlays.default
  ];
  nix.settings.allowed-users = [ "@wheel" ];
  nix.settings.trusted-users = [
    "${user}"
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
      "https://nix-community.cachix.org"
      "https://lanzaboote.cachix.org"
      "https://vicinae.cachix.org"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "lanzaboote.cachix.org-1:Nt9//zGmqkg1k5iu+B3bkj3OmHKjSw9pvf3faffLLNk="
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

}
