{ pkgs, ... }:
{
  services = {
    irqbalance.enable = true;
    dbus.implementation = "broker";
    system76-scheduler = {
      enable = true;
      settings = {
        cfsProfiles.enable = true;
        processScheduler.pipewireBoost.enable = true;
      };
    };
    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };
  };
}
