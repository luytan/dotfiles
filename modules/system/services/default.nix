{ lib, ... }:
with lib;
{
  options.modules.services = {
    nh = mkOption {
      type = types.bool;
      default = true;
      description = "Enable Nix Helper";
    };
    snapper = mkOption {
      type = types.bool;
      default = true;
      description = "Enable automatic snapshots with Snapper";
    };
    tlp = mkOption {
      type = types.bool;
      default = true;
      description = "Enable TLP power management";
    };
    lact = mkOption {
      type = types.bool;
      default = false;
      description = "Enable LACT";
    };
  };

  imports = [
    ./nh.nix
    ./snapper.nix
    ./tlp.nix
    ./lact.nix
  ];
}
