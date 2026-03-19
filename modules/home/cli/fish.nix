{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      zoxide init fish | source
    '';
    shellAliases = {
      nix-rebuild = "nh os switch -H $(hostname)";
      nix-rebuild-boot = "nh os boot -H $(hostname)";
      nix-clean = "nix-collect-garbage -d";
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
    ];
  };
  home.packages = with pkgs; [
    grc
  ];
}
