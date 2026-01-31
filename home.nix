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
    ./modules/home/editors/vscode.nix
    ./modules/home/common/discord.nix
    ./modules/home/desktop
    ./modules/home/editors
    ./modules/home/gaming
  ];

  home.packages = [
    pkgs-cisco.ciscoPacketTracer9
  ];
  home.file = {
  };
  modules.editors.ekphos = true;
  modules.desktop.hyprland = true;
  xdg = {
    enable = true;
  };
  home.sessionVariables = {
    EDITOR = "vim";
    TERMINAL = "konsole";
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
