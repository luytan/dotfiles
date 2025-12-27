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
    fira-code
    fira-code-symbols
  ];


  fonts.fontconfig = {
    enable = true;
    antialias = true;

    hinting = {
      enable = true;
      style = "slight";
      autohint = false;
    };

    subpixel = {
      rgba = "rgb";
      lcdfilter = "default";
    };

    defaultFonts = {
      monospace = [ "JetBrains Mono" ];
      sansSerif = [ "Inter" ];
      serif = [ "Noto Serif" "Source Serif Pro" ];
      emoji = [ "Noto Color Emoji" ];
    };
    allowBitmaps = false;
    useEmbeddedBitmaps = false;
  };
}