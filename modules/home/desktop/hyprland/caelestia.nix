{ pkgs, inputs, ... }:
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  programs.caelestia = {
    enable = true;
    cli = {
      enable = true;
      systemd = {
        enable = false;
        target = "graphical-session.target";
        environment = [ ];
      };
      settings = {
        theme = {
          enableGtk = false;
        };
      };
    };
  };
}
