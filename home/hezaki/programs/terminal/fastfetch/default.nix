{
  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "display": {
        "separator": " "
      },
      "logo": {
        "source": "nix_small"
      },
      "modules": [
        "title",
        {
          "type": "os",
          "key": " ",
          "format": "{3} {12}"
        },
        {
          "type": "kernel",
          "key": " "
        },
        {
          "type": "shell",
          "key": " "
        },
        {
          "type": "uptime",
          "key": "󰅶 "
        },
        {
          "type": "packages",
          "key": "󰏔 "
        },
        {
          "type": "wm",
          "key": " "
        },
      ]
    }
  '';
}
