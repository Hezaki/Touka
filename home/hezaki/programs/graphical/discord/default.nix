{ inputs, ... }:
{
  imports = with inputs; [ nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord.enable = false;
    vesktop.enable = true;

    config = {
      frameless = true;
      autoUpdate = true;
      useQuickCss = true;

      plugins = {
        clearUrls.enable = true;
        mutualGroupDms.enable = true;
        callTimer.enable = true;
        crashHandler.enable = true;
        fixImagesQuality.enable = true;
        fixYoutubeEmbeds.enable = true;
        quickReply.enable = true;
      };
    };
  };
}
