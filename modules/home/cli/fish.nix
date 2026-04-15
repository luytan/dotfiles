{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      zoxide init fish | source
      direnv hook fish | source
      starship init fish | source
    '';
    shellAliases = {
      nix-rebuild = "nh os switch -H $(hostname)";
      nix-rebuild-boot = "nh os boot -H $(hostname)";
      nix-clean = "nix-collect-garbage -d";
      cd = "z";
      cls = "clear";
      cat = "bat";
      tree = "eza --tree --level=3";
      tmpdir = "cd $(mktemp --directory)";
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
    starship
  ];
}
