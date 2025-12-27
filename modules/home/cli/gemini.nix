{pkgs, ...}:
{
  programs.gemini-cli = {
    enable = true;
    settings = {
      "preferredEditor" = "vim";
    };
  };
}