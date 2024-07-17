{
  powerManagement.enable = true;

  services = {
    thermald.enable = true;
    tlp = { 
      enable = true;
      settings = {
        INTEL_GPU_MIN_FREQ_ON_AC=400;
        INTEL_GPU_MIN_FREQ_ON_BAT=400;
        CPU_SCALING_GOVERNOR_ON_AC="performance";
        CPU_SCALING_GOVERNOR_ON_BAT="performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        # START_CHARGE_THRESH_BAT0 = 21;
        # STOP_CHARGE_THRESH_BAT0 = 91;
        RUNTIME_PM_ON_AC="auto";
      };
    };
  };
}
