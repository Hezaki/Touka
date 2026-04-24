{
  services = {
    power-profiles-daemon.enable = false;
    upower.enable = true;
    tlp.enable = false;
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
          scaling_max_freq = 1400000;
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
  };
}
