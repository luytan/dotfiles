{ inputs, pkgs, ... }:
{
  programs.spicetify = {
    enable = true;
    theme = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system}.themes.catppuccin;
    colorScheme = "mocha";
    enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system}.extensions; [
      adblockify
      hidePodcasts
      shuffle
    ];
  };
}