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
    udev = {
      enable = true;
      packages = with pkgs; [ qmk-udev-rules ];
    };
    pulseaudio = {
      enable = false;
      package = pkgs.pulseaudioFull;
    };
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
