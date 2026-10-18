{ pkgs, ... }:

{
  security.apparmor = {
    enable = true;
    killUnconfinedConfinables = true;

    packages = with pkgs; [ apparmor-profiles ];
  };
}
