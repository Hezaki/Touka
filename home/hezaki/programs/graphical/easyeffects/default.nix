{
  services.easyeffects.enable = true;
  xdg = {
    # autoloads
    configFile."easyeffects/autoload/output/bluez_output.CC_FF_90_42_64_45.1:headset-output.json".text = # json
      ''
        {
            "device": "bluez_output.CC_FF_90_42_64_45.1",
            "device-description": "HUAWEI FreeBuds 5i",
            "device-profile": "headset-output",
            "preset-name": "freeebuds 5i"
        }
      '';
    configFile."easyeffects/autoload/output/alsa_output.pci-0000_07_00.6.HiFi__Speaker__sink:\[Out\]\ Speaker.json".text = # json
      ''
        {
            "device": "alsa_output.pci-0000_07_00.6.HiFi__Speaker__sink",
            "device-description": "Family 17h/19h/1ah HD Audio Controller Speaker",
            "device-profile": "[Out] Speaker",
            "preset-name": "dolbyatmos"
        }
      '';
    # presets
    configFile."easyeffects/output/dolbyatmos.json".text = # json
      ''
        {
            "output": {
                "blocklist": [],
                "convolver#0": {
                    "autogain": true,
                    "bypass": false,
                    "input-gain": 0.0,
                    "ir-width": 100,
                    "kernel-name": "Dolby ATMOS ((128K MP3)) 1.Default",
                    "output-gain": 0.0
                },
                "plugins_order": [
                    "convolver#0"
                ]
            }
        }
      '';
    configFile."easyeffects/output/freeebuds\ 5i.json".text = # json
      ''
        {
            "output": {
                "blocklist": [],
                "equalizer#0": {
                    "balance": 0.0,
                    "bypass": false,
                    "input-gain": -3.77,
                    "left": {
                        "band0": {
                            "frequency": 105.0,
                            "gain": 1.5,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 0.6666666865348816,
                            "slope": "x1",
                            "solo": false,
                            "type": "Lo-shelf",
                            "width": 4.0
                        },
                        "band1": {
                            "frequency": 65.69999694824219,
                            "gain": 1.7000000476837158,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 1.0199999809265137,
                            "slope": "x1",
                            "solo": false,
                            "type": "Bell",
                            "width": 4.0
                        },
                        "band2": {
                            "frequency": 151.1999969482422,
                            "gain": -0.800000011920929,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 1.9199999570846558,
                            "slope": "x1",
                            "solo": false,
                            "type": "Bell",
                            "width": 4.0
                        },
                        "band3": {
                            "frequency": 309.29998779296875,
                            "gain": 0.699999988079071,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 1.7200000286102295,
                            "slope": "x1",
                            "solo": false,
                            "type": "Bell",
                            "width": 4.0
                        },
                        "band4": {
                            "frequency": 601.9000244140625,
                            "gain": -2.4000000953674316,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 1.0499999523162842,
                            "slope": "x1",
                            "solo": false,
                            "type": "Bell",
                            "width": 4.0
                        },
                        "band5": {
                            "frequency": 1930.9000244140625,
                            "gain": 2.0,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 2.309999942779541,
                            "slope": "x1",
                            "solo": false,
                            "type": "Bell",
                            "width": 4.0
                        },
                        "band6": {
                            "frequency": 5526.2001953125,
                            "gain": 1.399999976158142,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 5.199999809265137,
                            "slope": "x1",
                            "solo": false,
                            "type": "Bell",
                            "width": 4.0
                        },
                        "band7": {
                            "frequency": 6422.7001953125,
                            "gain": -2.0,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 6.0,
                            "slope": "x1",
                            "solo": false,
                            "type": "Bell",
                            "width": 4.0
                        },
                        "band8": {
                            "frequency": 8780.2001953125,
                            "gain": 3.5,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 1.9600000381469727,
                            "slope": "x1",
                            "solo": false,
                            "type": "Bell",
                            "width": 4.0
                        },
                        "band9": {
                            "frequency": 10000.0,
                            "gain": 0.699999988079071,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 0.6666666865348816,
                            "slope": "x1",
                            "solo": false,
                            "type": "Hi-shelf",
                            "width": 4.0
                        }
                    },
                    "mode": "IIR",
                    "num-bands": 10,
                    "output-gain": 0.0,
                    "pitch-left": 0.0,
                    "pitch-right": 0.0,
                    "right": {
                        "band0": {
                            "frequency": 105.0,
                            "gain": 1.5,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 0.6666666865348816,
                            "slope": "x1",
                            "solo": false,
                            "type": "Lo-shelf",
                            "width": 4.0
                        },
                        "band1": {
                            "frequency": 65.69999694824219,
                            "gain": 1.7000000476837158,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 1.0199999809265137,
                            "slope": "x1",
                            "solo": false,
                            "type": "Bell",
                            "width": 4.0
                        },
                        "band2": {
                            "frequency": 151.1999969482422,
                            "gain": -0.800000011920929,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 1.9199999570846558,
                            "slope": "x1",
                            "solo": false,
                            "type": "Bell",
                            "width": 4.0
                        },
                        "band3": {
                            "frequency": 309.29998779296875,
                            "gain": 0.699999988079071,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 1.7200000286102295,
                            "slope": "x1",
                            "solo": false,
                            "type": "Bell",
                            "width": 4.0
                        },
                        "band4": {
                            "frequency": 601.9000244140625,
                            "gain": -2.4000000953674316,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 1.0499999523162842,
                            "slope": "x1",
                            "solo": false,
                            "type": "Bell",
                            "width": 4.0
                        },
                        "band5": {
                            "frequency": 1930.9000244140625,
                            "gain": 2.0,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 2.309999942779541,
                            "slope": "x1",
                            "solo": false,
                            "type": "Bell",
                            "width": 4.0
                        },
                        "band6": {
                            "frequency": 5526.2001953125,
                            "gain": 1.399999976158142,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 5.199999809265137,
                            "slope": "x1",
                            "solo": false,
                            "type": "Bell",
                            "width": 4.0
                        },
                        "band7": {
                            "frequency": 6422.7001953125,
                            "gain": -2.0,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 6.0,
                            "slope": "x1",
                            "solo": false,
                            "type": "Bell",
                            "width": 4.0
                        },
                        "band8": {
                            "frequency": 8780.2001953125,
                            "gain": 3.5,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 1.9600000381469727,
                            "slope": "x1",
                            "solo": false,
                            "type": "Bell",
                            "width": 4.0
                        },
                        "band9": {
                            "frequency": 10000.0,
                            "gain": 0.699999988079071,
                            "mode": "APO (DR)",
                            "mute": false,
                            "q": 0.6666666865348816,
                            "slope": "x1",
                            "solo": false,
                            "type": "Hi-shelf",
                            "width": 4.0
                        }
                    },
                    "split-channels": false
                },
                "plugins_order": [
                    "equalizer#0"
                ]
            }
        }
      '';
  };
}
