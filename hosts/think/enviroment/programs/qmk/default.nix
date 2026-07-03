{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ via ];

  services.udev = {
    enable = true;
    packages = with pkgs; [ via ];
  };
}
