{ lib, config, ... }:
with lib;
let
  cfg = config.modules.virtualization;
in
{
  options.modules.virtualization = {
    kvm = mkOption {
      type = types.bool;
      default = false;
      description = "Enable KVM virtualization support";
    };
    vmware = mkOption {
      type = types.bool;
      default = false;
      description = "Enable VMware virtualization support";
    };
  };

  imports = [
    ./kvm.nix
    ./vmware.nix
  ];
}
