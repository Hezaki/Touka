{ pkgs, ... }:
{
  hardware = {
    firmware = with pkgs; [ linux-firmware ];
    bluetooth.enable = true;
    pulseaudio.enable = false;
    uinput.enable = true;
  };

  security.rtkit.enable = true;

  services = {
    ratbagd.enable = true;
    pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      wireplumber = {
        enable = true;
        extraConfig = {
          "10-disable-camera" = {
            "wireplumber.profiles" = {
              main."monitor.libcamera" = "disabled";
            };
          };
        };
      };
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };
}
