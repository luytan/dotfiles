{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    theme = "tokyo_night";
    settings = {
      general = {
        ipc_socket = false;
      };
      window = {
        dynamic_padding = true;
        decorations = "None";
      };
      terminal = {
        shell = "${pkgs.fish}/bin/fish";
      };
      font = {
        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "FiraCode Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "FiraCode Nerd Font";
          style = "Italic";
        };
        size = 12.0;
      };
    };
  };
}
