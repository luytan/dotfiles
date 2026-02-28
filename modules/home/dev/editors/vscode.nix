{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    profiles.default.extensions = with pkgs.vscode-marketplace-release; [
      enkia.tokyo-night
      ni3rav.andromeda-night
      #catppuccin.catppuccin-vsc
      pkief.material-icon-theme
      jnoortheen.nix-ide
      vue.volar
      foam.foam-vscode
      ms-vscode.cpptools
      #vscodevim.vim
      ms-azuretools.vscode-containers
      ms-python.python
      ms-vscode.cpptools
      esbenp.prettier-vscode
      redhat.vscode-yaml
      rust-lang.rust-analyzer
      tamasfe.even-better-toml
    ];
    profiles.default.userSettings = {
      "workbench.colorTheme" = "Tokyo Night";
      "workbench.iconTheme" = "material-icon-theme";
      "update.enableWindowsBackgroundUpdates" = false;
      "update.mode" = "manual";
      "extensions.autoUpdate" = false;
      "git.confirmSync" = false;
      "editor.fontFamily" = "Fira Code";
      "editor.fontLigatures" = true;
      "explorer.confirmDragAndDrop" = false;
      "diffEditor.ignoreTrimWhitespace" = false;
    };
  };
}
