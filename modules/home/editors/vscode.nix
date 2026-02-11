{ pkgs, pkgs-unstable, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      pkief.material-icon-theme
      jnoortheen.nix-ide
    ];
    profiles.default.userSettings = {
      "workbench.colorTheme" = "Catppuccin Macchiato";
      "workbench.iconTheme" = "material-icon-theme";
    };
  };
}
