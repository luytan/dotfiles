{
  config,
  pkgs,
  inputs,
  pkgs-cisco,
  user,
  ...
}:

{
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "25.11";
  imports = [
    ./modules/home/default.nix
  ];

  home.packages = [
    #    pkgs-cisco.ciscoPacketTracer9
    #inputs.librepods.packages.${pkgs.system}.default
    pkgs.gearlever
  ];
  fonts.fontconfig.enable = true;
  home.file = {
  };
  home.file.".face" = {
    source = pkgs.fetchurl {
      url = "https://cdn.discordapp.com/avatars/1396520220767686727/a_dab1c1d50eba77012a94db6085313e96.gif?size=4096";
      sha256 = "0y7pdbb3wgd18x9zd2nshyc5x0ha3nbm6jd5xxy5gdh1vxzbn5ld";
    };
  };

  xdg = {
    enable = true;
  };
  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };
    iconTheme = {
      name = "breeze-dark";
      package = pkgs.kdePackages.breeze-icons;
    };
  };
  home.pointerCursor = {
    enable = true;
    name = "Catppuccin-Macchiato-Mauve-Cursors";
    size = 24;
    package = pkgs.catppuccin-cursors.macchiatoMauve;
    gtk.enable = true;
  };

  home.sessionVariables = {
    EDITOR = "vim";
    TERMINAL = "ghostty";
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };
  programs.home-manager.enable = false;
}
