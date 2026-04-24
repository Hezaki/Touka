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
        ClearURLs.enable = true;
        MutualGroupDMs.enable = true;
        RPCStats.enable = true;
        betterFolders.enable = true;
        blockKrisp.enable = true;
        callTimer.enable = true;
        copyFileContents.enable = true;
        crashHandler.enable = true;
        declutter.enable = true;
        fixImagesQuality.enable = true;
        fixYoutubeEmbeds.enable = true;
        followVoiceUser.enable = true;
        hideMessages.enable = true;
        quickReply.enable = true;
        searchFix.enable = true;
      };
    };
  };
}
