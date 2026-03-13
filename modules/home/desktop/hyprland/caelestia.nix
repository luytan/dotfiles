{ pkgs, inputs, ... }:
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
    ./caelestia-dots
  ];

  programs.caelestia = {
    enable = true;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
    cli = {
      enable = true;
      settings = {
        theme = {
          enableGtk = false;
        };
      };
    };
  };
}
