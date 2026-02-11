{ inputs, pkgs, ... }:
{
  home.packages = [ inputs.ekphos.packages.${pkgs.stdenv.hostPlatform.system}.default ];
}
