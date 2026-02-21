{
  config,
  pkgs,
  inputs,
  pkgs-cisco,
  ...
}:

{
  home.username = "luytan";
  home.homeDirectory = "/home/luytan";
  home.stateVersion = "25.11";
  imports = [
    ./modules/home/default.nix
  ];

  home.packages = [
    #    pkgs-cisco.ciscoPacketTracer9
    #inputs.librepods.packages.${pkgs.system}.default
    pkgs.gearlever
  ];
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
  home.sessionVariables = {
    EDITOR = "vim";
    TERMINAL = "konsole";
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };
  programs.home-manager.enable = false;
}
