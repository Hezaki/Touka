{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ batsignal ];
  hardware.system76.power-daemon.enable = true;

  services = {
    upower.enable = true;
    tlp.enable = false;
    # auto-epp.enable = true;

    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          scaling_min_freq = "800000";
          scaling_max_freq = "1000000";
        };
      };
    };
  };
}
