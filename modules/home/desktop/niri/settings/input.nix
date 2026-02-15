
{ ... }:
{
  programs.niri.settings.input = {
    keyboard.xkb = {
      # layout = "us";
    };

    touchpad = {
      tap = true;
      # dwt = true;
      # dwtp = true;
      natural-scroll = true;
    };

    mouse = {
      # natural-scroll = true;
      "accel-speed" = 0;
    };
    focus-follows-mouse.enable = true;
    # warp-mouse-to-focus = true;
    # focus-follows-mouse.max-scroll-amount = "0%";
  };
}
