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
    services.upower.enable = true;
    powerManagement.powertop.enable = true;
    services.system76-scheduler.settings.cfsProfiles.enable = true;
    services.power-profiles-daemon.enable = false;
    services.thermald.enable = config.hardware.cpu.intel.updateMicrocode or false;
    services.tlp = {
      enable = true;
      settings = {
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "quiet";
        START_CHARGE_THRESH_BAT0 = 75;
        STOP_CHARGE_THRESH_BAT0 = 81;
        RUNTIME_PM_ON_AC = "auto";
      };
      pd = {
        enable = true;
      };
    };
  };
}
