{ ... }:
{
  # # FISH
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      zoxide init fish | source
    '';
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/Documents/NixOS/dotfiles#glaceon";
      rebuild-sylv = "sudo nixos-rebuild switch --flake ~/Documents/NixOS/dotfiles#sylveon";
      upd = "nix flake update --flake ~/Documents/NixOS/dotfiles";
      clean = "nix-collect-garbage -d";
      cd = "z";
      cls = "clear";
    };
  };
}
