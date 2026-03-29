{
  config,
  osConfig,
  lib,
  ...
}:
let
  cfg = config.modules.desktop;
  shellModule =
    {
      "noctalia" = ./noctalia.nix;
    }
    .${cfg.niri.shell} or null;
in
{
  imports = lib.optional (cfg.niri.enable && shellModule != null) shellModule;
}
