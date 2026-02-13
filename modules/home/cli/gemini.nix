{ pkgs, pkgs-unstable, ... }:
{
  programs.gemini-cli = {
    enable = true;
    package = pkgs-unstable.gemini-cli;
    settings = {
      general = {
        preferredEditor = "vim";
      };
      security = {
        auth = {
          selectedType = "oauth-personal";
        };
      };
    };
  };
}
