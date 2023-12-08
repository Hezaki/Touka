{
  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
        "type": "small"
      },
      "modules": [
        "title",
        {
          "type": "os",
          "format": "{3} {12}"
        },
        "kernel",
        "wm",
        "shell",
        "uptime",
        "memory",
      ]
    }
  '';
}
