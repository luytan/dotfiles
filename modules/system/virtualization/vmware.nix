{
  config,
  lib,
  pkgs-vmware,
  ...
}:
let
  cfg = config.modules.virtualization;
in
{
  config = lib.mkIf cfg.vmware {
    virtualisation.vmware.host.enable = true;
    environment.systemPackages = with pkgs-vmware; [
      vmware-workstation
    ];
  };
}
