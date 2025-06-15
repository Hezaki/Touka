{ pkgs, ... }:
{
  home.packages = with pkgs; [ fastfetch ];
  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "display": {
        "separator": " "
      },
      "logo": {
        "source": "nixos_small"
      },
      "modules": [
        "title",
        {
          "type": "os",
          "key": " ",
          "format": "{3} {12}"
        },
        {
          "type": "host",
          "key": " ",
          "format": "{3}"
        },
        {
          "type": "packages",
          "key": "󰏔 "
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
      ]
    }
  '';
}
