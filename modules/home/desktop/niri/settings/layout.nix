{ ... }:
{
  programs.niri.settings.layout = {
    gaps = 9;
    center-focused-column = "on-overflow";
    default-column-width.proportion = 0.5;

    focus-ring = {
      enable = true;
      width = 4;
      active.color = "#7fc8ff";
      inactive.color = "#505050";
    };

    border = {
      enable = false;
      width = 4;
      active.color = "#ffc87f";
      inactive.color = "#505050";
    };

    struts = {
      # left = 64;
      # right = 64;
      # top = 64;
      # bottom = 64;
    };
  };
}
