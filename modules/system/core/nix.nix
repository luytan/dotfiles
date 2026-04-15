{
  inputs,
  pkgs,
  user,
  ...
}:
{
  nixpkgs.overlays = [
    inputs.niri.overlays.niri
    inputs.nix-vscode-extensions.overlays.default
    inputs.nix-cachyos-kernel.overlays.pinned
    (final: prev: {
      material-symbols =
        inputs.nixpkgs-material-symbols.legacyPackages.${prev.system}.material-symbols;
    })
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
      "https://hyprland.cachix.org"
      "https://attic.xuyh0120.win/lantian"
      "https://rusic.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "lanzaboote.cachix.org-1:Nt9//zGmqkg1k5iu+B3bkj3OmHKjSw9pvf3faffLLNk="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "rusic.cachix.org-1:WXMpGpamblLUiJtcoxBxGGGGwIcWxGPJBUxarLiqWmw="
    ];
  };
  environment.systemPackages = with pkgs; [
    nixfmt
    nil
    nixd
    nixfmt-tree
  ];
}
