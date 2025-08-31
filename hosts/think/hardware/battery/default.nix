{
  
  hardware.system76.power-daemon.enable = true;
  # powerManagement.enable = true;

  services = {
    upower.enable = true;
    tlp.enable = false;
    power-profiles-daemon.enable = true;
  };
}
