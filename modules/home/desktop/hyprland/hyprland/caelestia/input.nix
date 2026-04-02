{ lib,... }:
with lib;
{
  wayland.windowManager.hyprland.settings = {
    # Input Settings
    input = {
      kb_layout = "fr";
      kb_variant = "us";
      numlock_by_default = true;
      repeat_delay = 250;
      repeat_rate = 35;

      follow_mouse = 1;
      focus_on_close = 1;
      sensitivity = 0;

      touchpad = {
        natural_scroll = true;
        disable_while_typing = "$touchpadDisableTyping";
        scroll_factor = "$touchpadScrollFactor";
      };
    };

    # Binds Settings
    binds = {
      scroll_event_delay = 0;
    };

    # Cursor Settings
    cursor = {
      hotspot_padding = 1;
    };
  };
}
