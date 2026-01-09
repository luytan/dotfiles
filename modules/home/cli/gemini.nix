{ pkgs, ... }:
{
  programs.gemini-cli = {
    enable = true;

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
