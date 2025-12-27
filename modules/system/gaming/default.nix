{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
  };

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  environment.systemPackages = with pkgs; [
    mangohud
  ];
}
