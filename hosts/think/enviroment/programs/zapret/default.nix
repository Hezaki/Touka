{ inputs, ... }:

{
  imports = with inputs; [
    zapret-discord-youtube.nixosModules.withTestTools
  ];

  services.zapret-discord-youtube = {
    enable = true;
    configName = "general (ALT12)";
    gameFilter = "all";
  };
}
