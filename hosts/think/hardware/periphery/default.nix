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
    system76-scheduler = {
      enable = true;
      useStockConfig = true;
    };
    udev = {
      enable = true;
      packages = with pkgs; [
        via
        qmk-udev-rules
      ];
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
      extraConfig.pipewire."92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.allowed-rates" = [
            44100
            48000
            96000
            192000
          ];
          "default.clock.min-quantum" = 512;
          "default.clock.quantum" = 2048;
          "default.clock.max-quantum" = 8192;
        };
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
