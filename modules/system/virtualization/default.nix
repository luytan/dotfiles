{ lib, config, ... }:
with lib;
let
  cfg = config.modules.virtualization;
in
{
  options.modules.virtualization = {
    kvm = mkEnableOption "kvm";
    vmware = mkEnableOption "vmware";
  };

  imports = [
    ./kvm.nix
    ./vmware.nix
  ];
}
