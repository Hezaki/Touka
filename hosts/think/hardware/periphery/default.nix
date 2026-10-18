{
  hardware = {
    bluetooth = {
      enable = true;
      settings = {
        General = {
          Experimental = true;
          Enable = "Source,Sink,Media,Socket";
          DiscoverableTimeout = 0;
          Class = "0x000100";
        };
      };
    };

    i2c.enable = true;

    uinput.enable = true;
  };

  security.rtkit.enable = true;

  services = {
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
          "default.clock.min-quantum" = 32;
          "default.clock.quantum" = 128;
          "default.clock.max-quantum" = 2048;
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
