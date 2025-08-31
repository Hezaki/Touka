{ pkgs, inputs, ... }:
{
  imports = with inputs; [ nix-gaming.nixosModules.pipewireLowLatency ];
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
    uinput.enable = true;
  };

  security.rtkit.enable = true;

  services = {
    udev.extraHwdb = ''
      mouse:usb:v046dpC53F:name:Logitech USB Receiver:*
       MOUSE_DPI=12000@1000
    '';
    pulseaudio.enable = false;
    ratbagd.enable = true;
    pcscd.enable = true;
    pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      lowLatency = {
        enable = true;
        quantum = 64;
        rate = 48000;
      };
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
