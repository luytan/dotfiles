{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.editors;
in
{
  options.modules.editors = {
    ekphos = mkEnableOption "ekphos";
  };

  imports = [
    ./ekphos.nix
  ];
}
