{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    inter 
    jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.ubuntu
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    noto-fonts-cjk-serif
    source-serif
  ];

  fonts.enableDefaultPackages = true;
  fonts.fontDir.enable = true;
  fonts.fontconfig = {
    enable = true;
    antialias = true;

    hinting = {
      enable = true;
      style = "none";
      autohint = false;
    };

    subpixel = {
      rgba = "none";
      lcdfilter = "none";
    };

    defaultFonts = {
      monospace = [ "JetBrains Mono" ];
      sansSerif = [ "Inter" ];
      serif = [ "Noto Serif" "Source Serif Pro" "Source Serif 4"];
      emoji = [ "Noto Color Emoji" ];
    };
    allowBitmaps = false;
    useEmbeddedBitmaps = true;
  };
}