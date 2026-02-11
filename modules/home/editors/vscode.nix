{ pkgs, pkgs-unstable, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      pkief.material-icon-theme
      jnoortheen.nix-ide
      vscodevim.vim
      ms-azuretools.vscode-containers
      ms-python.python
      ms-vscode.cpptools
      esbenp.prettier-vscode
      redhat.vscode-yaml
      rust-lang.rust-analyzer
    ];
    profiles.default.userSettings = {
      "workbench.colorTheme" = "Catppuccin Macchiato";
      "workbench.iconTheme" = "material-icon-theme";
      "update.enableWindowsBackgroundUpdates" = "false";
      "update.mode" = "manual";
      "extensions.autoUpdate" = "false";
    };
  };
}
