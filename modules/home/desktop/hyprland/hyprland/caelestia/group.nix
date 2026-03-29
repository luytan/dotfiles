{ lib,... }:
with lib;
{
  wayland.windowManager.hyprland.settings = {
    group = {
      auto_group = true;

      "col.border_active" = "$activeWindowBorderColour";
      "col.border_inactive" = "$inactiveWindowBorderColour";
      "col.border_locked_active" = "$activeWindowBorderColour";
      "col.border_locked_inactive" = "$inactiveWindowBorderColour";

      # Groupbar
      groupbar = {
        enabled = true;
        font_family = "JetBrains Mono NF";
        font_size = 15;
        gradients = true;
        gradient_round_only_edges = false;
        gradient_rounding = 5;
        height = 25;
        indicator_height = 0;
        gaps_in = 3;
        gaps_out = 3;
        render_titles = true;

        text_color = "rgb($onPrimary)";
        "col.active" = "rgba($primaryd4)";
        "col.inactive" = "rgba($outlined4)";
        "col.locked_active" = "rgba($primaryd4)";
        "col.locked_inactive" = "rgba($secondaryd4)";
      };
    };
  };
}
