{pkgs, ...}:
{
  home.packages = with pkgs; [
    ppsspp
    ryubing
  ];
}