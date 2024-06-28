{
  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpuFreqGovernor = "performance";
  };

  services = {
    upower = {
      enable = true;
      percentageLow = 15;
      usePercentageForPolicy = true;
    };
    tlp = { 
      enable = true;
      settings = {
        INTEL_GPU_MIN_FREQ_ON_AC=400;
        INTEL_GPU_MIN_FREQ_ON_BAT=400;
      };
    };
  };
}
