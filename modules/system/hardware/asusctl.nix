{
  config,
  lib,
  pkgs-unstable,
  inputs,
  ...
}:
let
  cfg = config.modules.hardware.asusctl;
in
{
  options.modules.hardware.asusctl.enable = lib.mkEnableOption "asusctl";

  config = lib.mkIf cfg.enable {
    #inputs.hybridmanager = {
    #  url = "git+ssh://git@github.com/luytan/hybridmanager?ref=dev";
    #};
    #services.hybridmanager.enable = true;
    services.asusd = {
      enable = true;
      package = pkgs-unstable.asusctl;
      enableUserService = true;
    };
    services.supergfxd.enable = false;
  };
}
