{ pkgs, ... }:
{
  home = {
    packages = [ pkgs.ayugram-desktop ];
    file = {
      ".local/share/AyuGramDesktop/tdata/shortcuts-custom.json".text = ''
        [
          {
            "command": "show_archive",
            "keys": "ctrl+b"
          },
          {
            "command": "search",
            "keys": "ctrl+/"
          },
          {
            "command": "global_search",
            "keys": "ctrl+f"
          }
        ]
      '';
      ".local/share/AyuGramDesktop/tdata/experimental_options.json".text = ''
        {
          "send-large-photos": true
          "ctrl-click-chat-new-window": true,
          "use-small-msg-bubble-radius": false
        }
      '';
      ".local/share/AyuGramDesktop/tdata/ayu_settings.json".text = ''
        {
          "appIcon": "chibi2",
          "channelBottomButton": 2,
          "collapseSimilarChannels": true,
          "deletedMark": "🧹",
          "disableAds": true,
          "disableCustomBackgrounds": true,
          "disableNotificationsDelay": true,
          "disableStories": true,
          "editedMark": "edited",
          "gifConfirmation": false,
          "hideAllChatsFolder": true,
          "hideFromBlocked": false,
          "hideNotificationBadge": false,
          "hideNotificationCounters": false,
          "hideSimilarChannels": false,
          "increaseWebviewHeight": false,
          "increaseWebviewWidth": false,
          "localPremium": true,
          "markReadAfterAction": false,
          "monoFont": "JetBrainsMono Nerd Font Mono",
          "recentStickersCount": 100,
          "saveDeletedMessages": true,
          "saveForBots": false,
          "saveMessagesHistory": true,
          "sendOfflinePacketAfterOnline": false,
          "sendOnlinePackets": true,
          "sendReadMessages": true,
          "sendReadStories": true,
          "sendUploadProgress": true,
          "sendWithoutSound": false,
          "showAttachButtonInMessageField": true,
          "showAttachPopup": true,
          "showAutoDeleteButtonInMessageField": true,
          "showCommandsButtonInMessageField": true,
          "showEmojiButtonInMessageField": true,
          "showEmojiPopup": true,
          "showGhostToggleInDrawer": true,
          "showGhostToggleInTray": true,
          "showHideMessageInContextMenu": 0,
          "showLReadToggleInDrawer": false,
          "showMessageDetailsInContextMenu": 2,
          "showMessageSeconds": false,
          "showMessageShot": true,
          "showMicrophoneButtonInMessageField": true,
          "showPeerId": 2,
          "showReactionsPanelInContextMenu": 1,
          "showSReadToggleInDrawer": false,
          "showStreamerToggleInDrawer": false,
          "showStreamerToggleInTray": false,
          "showUserMessagesInContextMenu": 2,
          "showViewsPanelInContextMenu": 1,
          "simpleQuotesAndReplies": true,
          "spoofWebviewAsAndroid": false,
          "stickerConfirmation": false,
          "useScheduledMessages": false,
          "voiceConfirmation": false,
          "wideMultiplier": 1.2000000000000002
        }
      '';
    };
  };
}
