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
      serif = [
        "Noto Serif"
        "Source Serif Pro"
        "Source Serif 4"
      ];
      emoji = [ "Noto Color Emoji" ];
    };
    allowBitmaps = false;
    useEmbeddedBitmaps = true;
  };

  environment.variables.FREETYPE_PROPERTIES = "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
}
