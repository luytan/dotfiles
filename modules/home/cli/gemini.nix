{ pkgs, ... }:
{
  programs.gemini-cli = {
    enable = true;
    package = pkgs.gemini-cli;
    settings = {
      general = {
        preferredEditor = "vim";
        previewFeatures = true;
      };
      security = {
        auth = {
          selectedType = "oauth-personal";
        };
      };
    };
  };
}
