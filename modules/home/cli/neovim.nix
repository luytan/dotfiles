{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nix4nvchad.homeManagerModules.default
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
}
