{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    batsignal
    powertop
  ];

  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpuFreqGovernor = "ondemand";
  };

  hardware.system76.power-daemon.enable = false;

  services = {
    thermald.enable = true;
    tlp = { 
      enable = false;
      settings = {
        USB_AUTOSUSPEND=1;
        CPU_SCALING_GOVERNOR_ON_AC="performance";
        CPU_SCALING_GOVERNOR_ON_BAT="performance";
        RUNTIME_PM_ON_AC="auto";
        RUNTIME_PM_ON_BAT="auto";
        PLATFORM_PROFILE_ON_AC = "balance_power";
        PLATFORM_PROFILE_ON_BAT = "performance";
        SCHED_POWERSAVE_ON_AC= 1;
        SCHED_POWERSAVE_ON_BAT= 0;
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "performance";
        DISK_DEVICES="nvme0n1";
        START_CHARGE_THRESH_BAT0 = 90;
        STOP_CHARGE_THRESH_BAT0 = 100;
      };
    };
  };
}
