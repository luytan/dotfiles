{ ... }:
{
  programs.ghostty = {
    enable = false;
    enableFishIntegration = true;
    settings = {
      theme = "TokyoNight Moon";
      command = "fish";
      confirm-close-surface = false;
      font-family = "FiraCode Nerd Font Mono";
      background-opacity = 1;
      window-decoration = "none";
    };
  };
}
