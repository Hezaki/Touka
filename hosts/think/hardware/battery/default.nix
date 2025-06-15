{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ batsignal ];

  powerManagement.enable = true;

  services = {
    upower.enable = true;
    thermald.enable = true;
    auto-cpufreq.enable = true;
    tlp.enable = false;
  };
  hardware.system76.power-daemon.enable = true;
}
