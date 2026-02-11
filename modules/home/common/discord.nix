{pkgs-unstable, ...}:

{
  programs.discord = {
    enable = true;
    package = pkgs-unstable.discord-canary.override {
      withEquicord = true;
    };
  };
}