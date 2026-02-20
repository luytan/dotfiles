{ pkgs, ... }:
{
  home.packages = with pkgs; [
    helm
    kubectl
    k9s
    ansible
  ];
}
