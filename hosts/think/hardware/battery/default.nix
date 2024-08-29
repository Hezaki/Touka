{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ batsignal ];

  powerManagement.enable = true;

  services = {
    upower.enable = true;
    thermald.enable = true;
    tlp = { 
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC="performance";
        CPU_SCALING_GOVERNOR_ON_BAT="performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_performance";
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
        RUNTIME_PM_ON_AC="auto";
        RUNTIME_PM_ON_BAT="auto";
      };
    };
  };
}
