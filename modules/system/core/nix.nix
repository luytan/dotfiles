{ ... }:
{
  nix.settings.allowed-users = [ "@wheel" ];
  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [

    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
}
