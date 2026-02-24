{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mangohud
    goverlay
    prismlauncher
    lutris
  ];
  xdg.desktopEntries = {
    gamescope = {
      name = "Gamescope";
      genericName = "Steam Big Picture";
      type = "Application";
      icon = "steam";
      exec = "gamescope -W 2560 -H 1440 -r 120 --adaptive-sync -f -e -- steam -gamepadui";
      terminal = false;
      categories = [ "Game" ];
    };
  };
}
