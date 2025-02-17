{ pkgs, ... }:
{
  hardware = {
    firmware = with pkgs; [ linux-firmware ];
    bluetooth = {
      enable = true;
      settings = {
        General = {
          Experimental = true;
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };
    pulseaudio = {
      enable = false;
      package = pkgs.pulseaudioFull;
    };
    uinput.enable = true;
  };

  security.rtkit.enable = true;

  services = {
    udev.extraHwdb = ''
      mouse:usb:v046dpC53F:name:Logitech USB Receiver:*
       MOUSE_DPI=12000@1000
    '';
    ratbagd.enable = true;
    ollama.enable = true;
    pcscd.enable = true;
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
