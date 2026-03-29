{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.services;
  intelMicrocodeEnabled = config.hardware.cpu.intel.updateMicrocode or false;
in
{
  config = lib.mkIf cfg.tlp {
    environment.systemPackages = with pkgs; [
      powertop
    ];

    powerManagement.powertop.enable = true;

    services.system76-scheduler.settings.cfsProfiles.enable = true;
    services.upower.enable = true;
    services.power-profiles-daemon.enable = false;
    services.thermald.enable = intelMicrocodeEnabled;

    services.tlp = {
      enable = true;
      settings = {
        CPU_BOOST_ON_AC = 0;
        CPU_BOOST_ON_BAT = 0;
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "quiet";
        RUNTIME_PM_ON_AC = "on";
        USB_AUTOSUSPEND = 0;

        WIFI_PWR_ON_AC = "off";
        WIFI_PWR_ON_BAT = "on";

        SOUND_POWER_SAVE_ON_AC = 0;
        SOUND_POWER_SAVE_ON_BAT = 1;
        SOUND_POWER_SAVE_CONTROLLER = "Y";

        START_CHARGE_THRESH_BAT0 = 75;
        STOP_CHARGE_THRESH_BAT0 = 81;
      };

      pd = {
        enable = true;
      };
    };
  };
}
