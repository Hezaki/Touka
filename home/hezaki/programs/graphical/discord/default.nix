{ inputs, ... }:
{
  imports = with inputs; [ nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord.enable = false;
    equibop.enable = true;

    config = {
      frameless = true;
      autoUpdate = true;
      useQuickCss = true;

      plugins = {
        clearUrls.enable = true;
        mutualGroupDms.enable = true;
        blockKrisp.enable = true;
        callTimer.enable = true;
        crashHandler.enable = true;
        declutter.enable = true;
        fixImagesQuality.enable = true;
        fixYoutubeEmbeds.enable = true;
        followVoiceUser.enable = true;
        quickReply.enable = true;
      };
    };
  };
}
