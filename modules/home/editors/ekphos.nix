{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
let
  cfg = config.modules.editors;
in
{
  config = lib.mkIf cfg.ekphos {
    home.packages = [ inputs.ekphos.packages.${pkgs.stdenv.hostPlatform.system}.default ];
  };
}
