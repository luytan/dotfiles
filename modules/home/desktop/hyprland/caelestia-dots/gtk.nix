{ pkgs, config, ... }:
{
  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    gtk4.theme = config.gtk.theme;

    #iconTheme = {
    #  name = "Papirus-Dark";
    #  package = pkgs.papirus-icon-theme;
    #};

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
  home.packages = with pkgs; [
    adw-gtk3
    papirus-icon-theme
    qtengine
    libsForQt5.qt5ct
    kdePackages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
    nerd-fonts.jetbrains-mono
  ];
}
