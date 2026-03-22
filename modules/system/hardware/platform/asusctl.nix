{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.hardware.platform;
in
{
  config = lib.mkIf cfg.asusctl {
    services.asusd = {
      enable = true;
      package = pkgs.asusctl;
      asusdConfig = {
        text = ''
          (
              charge_control_end_threshold: 81,
              base_charge_control_end_threshold: 0,
              disable_nvidia_powerd_on_battery: true,
              ac_command: "",
              bat_command: "",
              platform_profile_linked_epp: false,
              platform_profile_on_battery: Quiet,
              change_platform_profile_on_battery: false,
              platform_profile_on_ac: Performance,
              change_platform_profile_on_ac: false,
              profile_quiet_epp: Power,
              profile_balanced_epp: BalancePower,
              profile_custom_epp: Performance,
              profile_performance_epp: Performance,
              ac_profile_tunings: {
                  Quiet: (
                      enabled: false,
                      group: {},
                  ),
                  Performance: (
                      enabled: false,
                      group: {},
                  ),
              },
              dc_profile_tunings: {
                  Quiet: (
                      enabled: false,
                      group: {},
                  ),
                  Performance: (
                      enabled: false,
                      group: {},
                  ),
              },
              armoury_settings: {},
          )
        '';
      };
    };
    services.supergfxd.enable = false;
  };
}
