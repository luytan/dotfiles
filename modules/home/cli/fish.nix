{ pkgs, ... }:
let
  bobthefish = pkgs.fetchFromGitHub {
    owner = "oh-my-fish";
    repo = "theme-bobthefish";
    rev = "c5efbe05aed81b201454c0ae1190ba91ea1970ac";
    hash = "sha256-12Xd43vy6qQILV/Q5BeoGaul6DsQv5OloCPLXwR6KNU=";
  };
in
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
      set -g theme_powerline_fonts yes
      set -g theme_nerd_fonts yes
      set -g theme_display_git yes
      set -g theme_display_git_dirty yes
      set -g theme_display_cmd_duration yes
      set -g theme_display_date no
      set -g theme_color_scheme gruvbox
      zoxide init fish | source
    '';
    shellAliases = {
      nix-rebuild = "nh os switch -H $(hostname)";
      nix-rebuild-boot = "nh os boot -H $(hostname)";
      nix-clean = "nix-collect-garbage -d";
      niri-low = "niri msg output 'Thermotrex Corporation TL140ADXP01 Unknown' mode 1920x1200@60.000";
      niri-high = "niri msg output 'Thermotrex Corporation TL140ADXP01 Unknown' mode 2560x1600@120.000";
      cd = "z";
      cls = "clear";
      cat = "bat";
      tree = "eza --tree --level=3";
    };
    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      {
        name = "bobthefish";
        src = bobthefish;
      }
    ];
  };
  home.packages = with pkgs; [
    grc
  ];
}
