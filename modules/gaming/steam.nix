{ pkgs, ... }:
{
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
    };
  };

  home.sessionVariables = {
    PROTON_ENABLE_WAYLAND = 1;
    PROTON_ENABLE_HDR = 1;
  };
}