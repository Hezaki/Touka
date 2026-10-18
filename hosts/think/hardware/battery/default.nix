{
  services = {
    tlp = {
      enable = true;
      pd.enable = true;

      settings = {
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "powersave";
        CPU_BOOST_ON_BAT = 0;
        PLATFORM_PROFILE_ON_BAT = "low-power";

        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      };
    };

    power-profiles-daemon.enable = false;
  };
}
