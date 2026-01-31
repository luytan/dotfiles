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
    ./modules/home/cli/fish.nix
    ./modules/home/cli/git.nix
    ./modules/home/cli/gpg.nix
    ./modules/home/cli/zoxide.nix
    #./modules/home/editors/zed.nix
    ./modules/home/cli/ghostty.nix
    ./modules/home/editors/vscode.nix
    ./modules/home/cli/eza.nix
    ./modules/home/cli/zellij.nix
    ./modules/home/common/discord.nix
    ./modules/home/cli/gemini.nix
    ./modules/home/default.nix
    ./modules/home/desktop
    ./modules/home/editors
    ./modules/home/gaming
  ];

  home.packages = [
    pkgs-cisco.ciscoPacketTracer9
  ];

  #programs.ssh = {
  #  enable = true;
  #  extraConfig = ''
  #    Host *
  #      AddKeysToAgent yes
  #  '';
  #};

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
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
