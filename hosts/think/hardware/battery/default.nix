{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ batsignal ];

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  services = {
    upower.enable = true;
    thermald.enable = true;
    tlp = {
      enable = true;
      settings = {
        SCHED_POWERSAVE_ON_AC="0";
        SCHED_POWERSAVE_ON_BAT="1";
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        RUNTIME_PM_ON_AC = "auto";
        RUNTIME_PM_ON_BAT = "auto";
      };
    };
  };
}
