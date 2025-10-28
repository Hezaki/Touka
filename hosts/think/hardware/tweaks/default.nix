{ pkgs, ... }:
{
  services = {
    irqbalance.enable = true;
    dbus.implementation = "broker";
    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };
  };
}
