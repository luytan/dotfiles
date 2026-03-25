{
  config,
  pkgs,
  inputs,
  user,
  ...
}:

{
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "25.11";
  imports = [
    ./modules/home/default.nix
    inputs.nix4nvchad.homeManagerModules.default
  ];

  home.packages = [
    #inputs.librepods.packages.${pkgs.system}.default
  ];
  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      docker-compose-language-service
      nixd
      gopls
    ];
    hm-activation = true;
    backup = false;
  };
  fonts.fontconfig.enable = true;
  home.file = {
    ".face" = {
      source = pkgs.fetchurl {
        url = "https://cdn.discordapp.com/avatars/1396520220767686727/a_dab1c1d50eba77012a94db6085313e96.gif?size=4096";
        sha256 = "0y7pdbb3wgd18x9zd2nshyc5x0ha3nbm6jd5xxy5gdh1vxzbn5ld";
      };
    };
    ".wall" = {
      source = pkgs.fetchurl {
        url = "https://i.imgur.com/R0Qjwou.png";
        hash = "sha256-qchRpbp2RnsZVpoPe1dWugNIgYLwckMJdFO83M6tyyk=";
      };
    };
  };

  xdg = {
    enable = true;
  };
  home.pointerCursor = {
    enable = true;
    name = "catppuccin-macchiato-mauve-cursors";
    size = 24;
    package = pkgs.catppuccin-cursors.macchiatoMauve;
    gtk.enable = true;
    hyprcursor.enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "alacritty";
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };
  programs.home-manager.enable = false;
}
