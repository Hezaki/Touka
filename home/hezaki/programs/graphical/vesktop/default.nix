{ pkgs, config, ... }: {
  home.packages = with pkgs; [ vesktop ];
  xdg.configFile = {
    "vesktop/settings/settings.json".text = ''
    {
        "autoUpdate": false,
        "autoUpdateNotification": true,
        "useQuickCss": true,
        "themeLinks": [],
        "enabledThemes": [
            "stylix.theme.css"
        ],
        "enableReactDevtools": true,
        "frameless": true,
        "transparent": true,
        "winCtrlQ": false,
        "disableMinSize": false,
        "winNativeTitleBar": false,
        "plugins": {
            "ChatInputButtonAPI": {
                "enabled": true
            },
            "CommandsAPI": {
                "enabled": true
            },
            "MemberListDecoratorsAPI": {
                "enabled": false
            },
            "MessageAccessoriesAPI": {
                "enabled": true
            },
            "MessageDecorationsAPI": {
                "enabled": false
            },
            "MessageEventsAPI": {
                "enabled": true
            },
            "MessagePopoverAPI": {
                "enabled": true
            },
            "MessageUpdaterAPI": {
                "enabled": true
            },
            "ServerListAPI": {
                "enabled": false
            },
            "AlwaysAnimate": {
                "enabled": false
            },
            "AlwaysTrust": {
                "enabled": false
            },
            "AnonymiseFileNames": {
                "enabled": false
            },
            "WebRichPresence (arRPC)": {
                "enabled": false
            },
            "AutomodContext": {
                "enabled": false
            },
            "BANger": {
                "enabled": false
            },
            "BetterFolders": {
                "enabled": true,
                "sidebar": true,
                "sidebarAnim": true,
                "closeAllFolders": false,
                "closeAllHomeButton": false,
                "closeOthers": false,
                "forceOpen": false,
                "keepIcons": false,
                "showFolderIcon": 1
            },
            "BetterGifAltText": {
                "enabled": false
            },
            "BetterGifPicker": {
                "enabled": true
            },
            "BetterNotesBox": {
                "enabled": true,
                "hide": false,
                "noSpellCheck": false
            },
            "BetterRoleContext": {
                "enabled": false
            },
            "BetterRoleDot": {
                "enabled": true,
                "bothStyles": false,
                "copyRoleColorInProfilePopout": false
            },
            "BetterSessions": {
                "enabled": false
            },
            "BetterSettings": {
                "enabled": false,
                "disableFade": true,
                "eagerLoad": true
            },
            "BetterUploadButton": {
                "enabled": true
            },
            "BiggerStreamPreview": {
                "enabled": true
            },
            "BlurNSFW": {
                "enabled": false
            },
            "CallTimer": {
                "enabled": true,
                "format": "stopwatch"
            },
            "ClearURLs": {
                "enabled": false
            },
            "ClientTheme": {
                "enabled": false
            },
            "ColorSighted": {
                "enabled": true
            },
            "ConsoleShortcuts": {
                "enabled": true
            },
            "CopyUserURLs": {
                "enabled": false
            },
            "CrashHandler": {
                "enabled": true
            },
            "CtrlEnterSend": {
                "enabled": false
            },
            "CustomRPC": {
                "enabled": false,
                "type": 0,
                "timestampMode": 0
            },
            "CustomIdle": {
                "enabled": false
            },
            "Dearrow": {
                "enabled": false
            },
            "Decor": {
                "enabled": false
            },
            "DisableCallIdle": {
                "enabled": false
            },
            "DontRoundMyTimestamps": {
                "enabled": false
            },
            "EmoteCloner": {
                "enabled": false
            },
            "Experiments": {
                "enabled": false
            },
            "F8Break": {
                "enabled": false
            },
            "FakeNitro": {
                "enabled": true,
                "enableEmojiBypass": true,
                "enableStickerBypass": true,
                "enableStreamQualityBypass": true,
                "transformStickers": true,
                "transformEmojis": true,
                "transformCompoundSentence": false,
                "stickerSize": 160,
                "hyperLinkText": "{{NAME}}",
                "useHyperLinks": true,
                "disableEmbedPermissionCheck": false
            },
            "FakeProfileThemes": {
                "enabled": false
            },
            "FavoriteEmojiFirst": {
                "enabled": false
            },
            "FavoriteGifSearch": {
                "enabled": false
            },
            "FixCodeblockGap": {
                "enabled": false
            },
            "FixSpotifyEmbeds": {
                "enabled": false
            },
            "FixYoutubeEmbeds": {
                "enabled": false
            },
            "ForceOwnerCrown": {
                "enabled": false
            },
            "FriendInvites": {
                "enabled": false
            },
            "FriendsSince": {
                "enabled": false
            },
            "GameActivityToggle": {
                "enabled": false
            },
            "GifPaste": {
                "enabled": false
            },
            "GreetStickerPicker": {
                "enabled": false
            },
            "HideAttachments": {
                "enabled": false
            },
            "iLoveSpam": {
                "enabled": false
            },
            "IgnoreActivities": {
                "enabled": false
            },
            "ImageLink": {
                "enabled": true
            },
            "ImageZoom": {
                "enabled": false,
                "size": 100,
                "zoom": 2.0500000000000003,
                "nearestNeighbour": false,
                "square": false,
                "saveZoomValues": true,
                "invertScroll": true,
                "zoomSpeed": 0.5
            },
            "ImplicitRelationships": {
                "enabled": false
            },
            "InvisibleChat": {
                "enabled": false
            },
            "KeepCurrentChannel": {
                "enabled": false
            },
            "LastFMRichPresence": {
                "enabled": false
            },
            "LoadingQuotes": {
                "enabled": false
            },
            "MaskedLinkPaste": {
                "enabled": false
            },
            "MemberCount": {
                "enabled": true,
                "memberList": true,
                "toolTip": true
            },
            "MessageClickActions": {
                "enabled": true,
                "enableDeleteOnClick": true,
                "enableDoubleClickToEdit": true,
                "enableDoubleClickToReply": true,
                "requireModifier": false
            },
            "MessageLatency": {
                "enabled": false
            },
            "MessageLinkEmbeds": {
                "enabled": false
            },
            "MessageLogger": {
                "enabled": true,
                "deleteStyle": "text",
                "ignoreBots": false,
                "ignoreSelf": false,
                "ignoreUsers": "",
                "ignoreChannels": "",
                "ignoreGuilds": "",
                "logEdits": true,
                "logDeletes": true
            },
            "MessageTags": {
                "enabled": false
            },
            "MoreCommands": {
                "enabled": false
            },
            "MoreKaomoji": {
                "enabled": false
            },
            "MoreUserTags": {
                "enabled": false
            },
            "Moyai": {
                "enabled": false
            },
            "MutualGroupDMs": {
                "enabled": false
            },
            "NewGuildSettings": {
                "enabled": false
            },
            "NoBlockedMessages": {
                "enabled": true,
                "ignoreBlockedMessages": false
            },
            "NoDefaultHangStatus": {
                "enabled": false
            },
            "NoDevtoolsWarning": {
                "enabled": false
            },
            "NoF1": {
                "enabled": false
            },
            "NoMosaic": {
                "enabled": false
            },
            "NoPendingCount": {
                "enabled": false
            },
            "NoProfileThemes": {
                "enabled": true
            },
            "NoReplyMention": {
                "enabled": false,
                "userList": "1234567890123445,1234567890123445",
                "shouldPingListed": true
            },
            "NoScreensharePreview": {
                "enabled": false
            },
            "NoServerEmojis": {
                "enabled": false
            },
            "NoTypingAnimation": {
                "enabled": false
            },
            "NoUnblockToJump": {
                "enabled": false
            },
            "NormalizeMessageLinks": {
                "enabled": false
            },
            "NotificationVolume": {
                "enabled": true,
                "notificationVolume": 35.73943661971831
            },
            "NSFWGateBypass": {
                "enabled": false
            },
            "OnePingPerDM": {
                "enabled": false
            },
            "oneko": {
                "enabled": false
            },
            "OpenInApp": {
                "enabled": false
            },
            "OverrideForumDefaults": {
                "enabled": false
            },
            "PartyMode": {
                "enabled": false
            },
            "PauseInvitesForever": {
                "enabled": false
            },
            "PermissionFreeWill": {
                "enabled": false
            },
            "PermissionsViewer": {
                "enabled": false
            },
            "petpet": {
                "enabled": false
            },
            "PictureInPicture": {
                "enabled": false
            },
            "PinDMs": {
                "enabled": false
            },
            "PlainFolderIcon": {
                "enabled": true
            },
            "PlatformIndicators": {
                "enabled": false
            },
            "PreviewMessage": {
                "enabled": false
            },
            "PronounDB": {
                "enabled": false
            },
            "QuickMention": {
                "enabled": false
            },
            "QuickReply": {
                "enabled": true,
                "shouldMention": 2
            },
            "ReactErrorDecoder": {
                "enabled": false
            },
            "ReadAllNotificationsButton": {
                "enabled": false
            },
            "RelationshipNotifier": {
                "enabled": false
            },
            "ReplaceGoogleSearch": {
                "enabled": false
            },
            "ReplyTimestamp": {
                "enabled": true
            },
            "ResurrectHome": {
                "enabled": true,
                "forceServerHome": true
            },
            "RevealAllSpoilers": {
                "enabled": false
            },
            "ReverseImageSearch": {
                "enabled": false
            },
            "ReviewDB": {
                "enabled": false
            },
            "RoleColorEverywhere": {
                "enabled": true,
                "chatMentions": true,
                "memberList": true,
                "voiceUsers": true
            },
            "SearchReply": {
                "enabled": false
            },
            "SecretRingToneEnabler": {
                "enabled": true
            },
            "Summaries": {
                "enabled": false
            },
            "SendTimestamps": {
                "enabled": false
            },
            "ServerListIndicators": {
                "enabled": false
            },
            "ShikiCodeblocks": {
                "enabled": false
            },
            "ShowAllMessageButtons": {
                "enabled": false
            },
            "ShowConnections": {
                "enabled": false
            },
            "ShowHiddenChannels": {
                "enabled": true,
                "showMode": 0,
                "hideUnreads": true
            },
            "ShowHiddenThings": {
                "enabled": true,
                "showTimeouts": true,
                "showInvitesPaused": true,
                "showModView": true,
                "disableDiscoveryFilters": true,
                "disableDisallowedDiscoveryFilters": true
            },
            "ShowMeYourName": {
                "enabled": false
            },
            "ShowTimeoutDuration": {
                "enabled": false
            },
            "SilentMessageToggle": {
                "enabled": false
            },
            "SilentTyping": {
                "enabled": false
            },
            "SortFriendRequests": {
                "enabled": false
            },
            "SpotifyControls": {
                "enabled": false
            },
            "SpotifyCrack": {
                "enabled": false
            },
            "SpotifyShareCommands": {
                "enabled": false
            },
            "StartupTimings": {
                "enabled": false
            },
            "StreamerModeOnStream": {
                "enabled": false
            },
            "SuperReactionTweaks": {
                "enabled": false
            },
            "TextReplace": {
                "enabled": false
            },
            "ThemeAttributes": {
                "enabled": false
            },
            "TimeBarAllActivities": {
                "enabled": false
            },
            "Translate": {
                "enabled": true,
                "autoTranslate": false,
                "showChatBarButton": true,
                "receivedInput": "auto",
                "receivedOutput": "en"
            },
            "TypingIndicator": {
                "enabled": false
            },
            "TypingTweaks": {
                "enabled": false
            },
            "Unindent": {
                "enabled": false
            },
            "UnlockedAvatarZoom": {
                "enabled": false
            },
            "UnsuppressEmbeds": {
                "enabled": false
            },
            "UrbanDictionary": {
                "enabled": false
            },
            "UserVoiceShow": {
                "enabled": false
            },
            "USRBG": {
                "enabled": false
            },
            "ValidReply": {
                "enabled": false
            },
            "ValidUser": {
                "enabled": false
            },
            "VoiceChatDoubleClick": {
                "enabled": false
            },
            "VcNarrator": {
                "enabled": false
            },
            "VencordToolbox": {
                "enabled": false
            },
            "ViewIcons": {
                "enabled": true
            },
            "ViewRaw": {
                "enabled": false
            },
            "VoiceDownload": {
                "enabled": false
            },
            "VoiceMessages": {
                "enabled": true,
                "noiseSuppression": true,
                "echoCancellation": true
            },
            "WatchTogetherAdblock": {
                "enabled": false
            },
            "WebKeybinds": {
                "enabled": true
            },
            "WebScreenShareFixes": {
                "enabled": true
            },
            "WhoReacted": {
                "enabled": false
            },
            "Wikisearch": {
                "enabled": false
            },
            "XSOverlay": {
                "enabled": false
            },
            "NoTrack": {
                "enabled": true,
                "disableAnalytics": true
            },
            "WebContextMenus": {
                "enabled": true,
                "addBack": true
            },
            "Settings": {
                "enabled": true,
                "settingsLocation": "aboveNitro"
            },
            "ServerInfo": {
                "enabled": false
            },
            "AppleMusicRichPresence": {
                "enabled": false
            },
            "CopyEmojiMarkdown": {
                "enabled": false
            },
            "NoOnboardingDelay": {
                "enabled": false
            },
            "SupportHelper": {
                "enabled": false
            }
        },
        "notifications": {
            "timeout": 5000,
            "position": "bottom-right",
            "useNative": "never",
            "logLimit": 50
        },
        "cloud": {
            "authenticated": false,
            "url": "https://api.vencord.dev/",
            "settingsSync": true,
            "settingsSyncVersion": 1717885801563
        }
    }
    '';
    "vesktop/themes/stylix.theme.css".text = ''
    :root {
        --base00: #${config.lib.stylix.colors.base00}; /* Black */
        --base01: #${config.lib.stylix.colors.base00}; /* Bright Black */
        --base02: #${config.lib.stylix.colors.base02}; /* Grey */
        --base03: #${config.lib.stylix.colors.base03}; /* Brighter Grey */
        --base04: #${config.lib.stylix.colors.base04}; /* Bright Grey */
        --base05: #${config.lib.stylix.colors.base05}; /* White */
        --base06: #${config.lib.stylix.colors.base06}; /* Brighter White */
        --base07: #${config.lib.stylix.colors.base07}; /* Bright White */
        --base08: #${config.lib.stylix.colors.base08}; /* Red */
        --base09: #${config.lib.stylix.colors.base09}; /* Orange */
        --base0A: #${config.lib.stylix.colors.base0A}; /* Yellow */
        --base0B: #${config.lib.stylix.colors.base0B}; /* Green */
        --base0C: #${config.lib.stylix.colors.base0C}; /* Cyan */
        --base0D: #${config.lib.stylix.colors.base0D}; /* Blue */
        --base0E: #${config.lib.stylix.colors.base0E}; /* Purple */
        --base0F: #${config.lib.stylix.colors.base0F}; /* Magenta */

        --primary-630: var(--base00); /* Autocomplete background */
        --primary-660: var(--base00); /* Search input background */
    }

    .theme-light, .theme-dark {
        --search-popout-option-fade: none; /* Disable fade for search popout */
        --bg-overlay-2: var(--base00); /* These 2 are needed for proper threads coloring */
        --home-background: var(--base00);
        --background-primary: var(--base00);
        --background-secondary: var(--base01);
        --background-secondary-alt: var(--base01);
        --channeltextarea-background: var(--base01);
        --background-tertiary: var(--base00);
        --background-accent: var(--base0E);
        --background-floating: var(--base01);
        --background-modifier-hover: #0f0f0f4c; /* 30% of base00 */
        --background-modifier-selected: var(--base00);
        --text-normal: var(--base05);
        --text-secondary: var(--base00);
        --text-muted: var(--base03);
        --text-link: var(--base0C);
        --interactive-normal: var(--base05);
        --interactive-hover: var(--base05);
        --interactive-active: var(--base07);
        --interactive-muted: var(--base03);
        --channels-default: var(--base04);
        --channel-icon: var(--base04);
        --header-primary: var(--base06);
        --header-secondary: var(--base03);
        --scrollbar-thin-track: transparent;
        --scrollbar-auto-track: transparent;
    }
    '';
  };
}
