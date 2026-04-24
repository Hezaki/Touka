{
  programs.noctalia-shell.enable = true;

  xdg.configFile."noctalia/settings.json".text = ''
    {
      "settingsVersion": 59,
      "bar": {
        "barType": "simple",
        "position": "left",
        "monitors": [
          "eDP-1",
          "DP-2"
        ],
        "density": "comfortable",
        "showOutline": false,
        "showCapsule": true,
        "capsuleOpacity": 1,
        "capsuleColorKey": "none",
        "widgetSpacing": 6,
        "contentPadding": 0,
        "fontScale": 1.06,
        "enableExclusionZoneInset": true,
        "backgroundOpacity": 0,
        "useSeparateOpacity": false,
        "marginVertical": 4,
        "marginHorizontal": 4,
        "frameThickness": 8,
        "frameRadius": 12,
        "outerCorners": false,
        "hideOnOverview": false,
        "displayMode": "always_visible",
        "autoHideDelay": 500,
        "autoShowDelay": 150,
        "showOnWorkspaceSwitch": true,
        "widgets": {
          "left": [
            {
              "colorizeDistroLogo": false,
              "colorizeSystemIcon": "primary",
              "colorizeSystemText": "none",
              "customIconPath": "/home/hezaki/Downloads/StickerLogo/nix-snowflake-white.svg",
              "enableColorization": true,
              "icon": "noctalia",
              "id": "ControlCenter",
              "useDistroLogo": false
            },
            {
              "characterCount": 2,
              "colorizeIcons": false,
              "emptyColor": "secondary",
              "enableScrollWheel": true,
              "focusedColor": "primary",
              "followFocusedScreen": false,
              "fontWeight": "bold",
              "groupedBorderOpacity": 1,
              "hideUnoccupied": false,
              "iconScale": 0.8,
              "id": "Workspace",
              "labelMode": "none",
              "occupiedColor": "secondary",
              "pillSize": 0.55,
              "showApplications": false,
              "showApplicationsHover": false,
              "showBadge": true,
              "showLabelsOnlyWhenOccupied": true,
              "unfocusedIconsOpacity": 1
            },
            {
              "defaultSettings": {
                "hideBackground": false,
                "minimumThreshold": 10
              },
              "id": "plugin:catwalk"
            }
          ],
          "center": [],
          "right": [
            {
              "compactMode": false,
              "hideMode": "hidden",
              "hideWhenIdle": false,
              "id": "MediaMini",
              "maxWidth": 145,
              "panelShowAlbumArt": true,
              "scrollingMode": "hover",
              "showAlbumArt": true,
              "showArtistFirst": true,
              "showProgressRing": true,
              "showVisualizer": false,
              "textColor": "none",
              "useFixedWidth": false,
              "visualizerType": "linear"
            },
            {
              "blacklist": [],
              "chevronColor": "none",
              "colorizeIcons": true,
              "drawerEnabled": false,
              "hidePassive": false,
              "id": "Tray",
              "pinned": [
                "9C4fKszwNf",
                "steam",
                "AyuGram Desktop"
              ]
            },
            {
              "defaultSettings": {
                "compactMode": false,
                "defaultPeerAction": "copy-ip",
                "hideDisconnected": false,
                "hideMullvadExitNodes": true,
                "pingCount": 5,
                "refreshInterval": 5000,
                "showIpAddress": true,
                "showPeerCount": true,
                "sshUsername": "",
                "taildropDownloadDir": "~/Downloads",
                "taildropEnabled": true,
                "taildropReceiveMode": "operator",
                "terminalCommand": ""
              },
              "id": "plugin:tailscale"
            },
            {
              "displayMode": "alwaysHide",
              "iconColor": "none",
              "id": "KeyboardLayout",
              "showIcon": false,
              "textColor": "none"
            },
            {
              "displayMode": "onhover",
              "iconColor": "none",
              "id": "Bluetooth",
              "textColor": "none"
            },
            {
              "displayMode": "onhover",
              "iconColor": "none",
              "id": "Microphone",
              "middleClickCommand": "pwvucontrol || pavucontrol",
              "textColor": "none"
            },
            {
              "displayMode": "onhover",
              "iconColor": "none",
              "id": "Volume",
              "middleClickCommand": "pwvucontrol || pavucontrol",
              "textColor": "none"
            },
            {
              "clockColor": "primary",
              "customFont": "Lato ExtraBold",
              "formatHorizontal": "HH:mm ddd, MMM dd",
              "formatVertical": "HH mm — dd MM",
              "id": "Clock",
              "tooltipFormat": "HH:mm ddd, MMM dd",
              "useCustomFont": true
            },
            {
              "deviceNativePath": "__default__",
              "displayMode": "graphic-clean",
              "hideIfIdle": false,
              "hideIfNotDetected": true,
              "id": "Battery",
              "showNoctaliaPerformance": false,
              "showPowerProfiles": false
            },
            {
              "hideWhenZero": false,
              "hideWhenZeroUnread": false,
              "iconColor": "none",
              "id": "NotificationHistory",
              "showUnreadBadge": true,
              "unreadBadgeColor": "primary"
            },
            {
              "defaultSettings": {
                "activeColor": "primary",
                "enableToast": true,
                "hideInactive": false,
                "iconSpacing": 4,
                "inactiveColor": "none",
                "micFilterRegex": "",
                "removeMargins": false
              },
              "id": "plugin:privacy-indicator"
            }
          ]
        },
        "mouseWheelAction": "none",
        "reverseScroll": false,
        "mouseWheelWrap": true,
        "middleClickAction": "none",
        "middleClickFollowMouse": false,
        "middleClickCommand": "",
        "rightClickAction": "controlCenter",
        "rightClickFollowMouse": true,
        "rightClickCommand": "",
        "screenOverrides": [
          {
            "density": "comfortable",
            "enabled": false,
            "name": "DP-2",
            "position": "left",
            "widgets": null
          },
          {
            "displayMode": "always_visible",
            "enabled": false,
            "name": "eDP-1",
            "widgets": {
              "center": [
                {
                  "characterCount": 2,
                  "colorizeIcons": false,
                  "emptyColor": "secondary",
                  "enableScrollWheel": true,
                  "focusedColor": "primary",
                  "followFocusedScreen": false,
                  "fontWeight": "bold",
                  "groupedBorderOpacity": 1,
                  "hideUnoccupied": false,
                  "iconScale": 0.8,
                  "id": "Workspace",
                  "labelMode": "none",
                  "occupiedColor": "secondary",
                  "pillSize": 0.65,
                  "showApplications": false,
                  "showApplicationsHover": false,
                  "showBadge": true,
                  "showLabelsOnlyWhenOccupied": false,
                  "unfocusedIconsOpacity": 1
                }
              ],
              "left": [
                {
                  "colorizeDistroLogo": false,
                  "colorizeSystemIcon": "primary",
                  "customIconPath": "/home/hezaki/Downloads/StickerLogo/nix-snowflake-white.svg",
                  "enableColorization": true,
                  "icon": "noctalia",
                  "id": "ControlCenter",
                  "useDistroLogo": false
                },
                {
                  "applyToAllMonitors": false,
                  "displayMode": "onhover",
                  "iconColor": "none",
                  "id": "Brightness",
                  "textColor": "none"
                },
                {
                  "displayMode": "onhover",
                  "iconColor": "none",
                  "id": "Volume",
                  "middleClickCommand": "pwvucontrol || pavucontrol",
                  "textColor": "none"
                },
                {
                  "displayMode": "onhover",
                  "iconColor": "none",
                  "id": "Microphone",
                  "middleClickCommand": "pwvucontrol || pavucontrol",
                  "textColor": "none"
                },
                {
                  "displayMode": "forceOpen",
                  "iconColor": "none",
                  "id": "KeyboardLayout",
                  "showIcon": true,
                  "textColor": "none"
                },
                {
                  "defaultSettings": {
                    "catColor": "default",
                    "catOffsetY": 0,
                    "catSize": 1,
                    "idleTimeout": 150,
                    "raveMode": false,
                    "tappyMode": false,
                    "useMprisFilter": false,
                    "waitingTimeout": 30000
                  },
                  "id": "plugin:slowbongo"
                }
              ],
              "right": [
                {
                  "compactMode": true,
                  "hideMode": "hidden",
                  "hideWhenIdle": false,
                  "id": "MediaMini",
                  "maxWidth": 32,
                  "panelShowAlbumArt": true,
                  "scrollingMode": "never",
                  "showAlbumArt": true,
                  "showArtistFirst": false,
                  "showProgressRing": true,
                  "showVisualizer": false,
                  "textColor": "none",
                  "useFixedWidth": true,
                  "visualizerType": "linear"
                },
                {
                  "blacklist": [],
                  "chevronColor": "none",
                  "colorizeIcons": true,
                  "drawerEnabled": false,
                  "hidePassive": false,
                  "id": "Tray",
                  "pinned": []
                },
                {
                  "defaultSettings": {
                    "compactMode": false,
                    "defaultPeerAction": "copy-ip",
                    "hideDisconnected": false,
                    "hideMullvadExitNodes": true,
                    "pingCount": 5,
                    "refreshInterval": 5000,
                    "showIpAddress": true,
                    "showPeerCount": true,
                    "sshUsername": "",
                    "taildropDownloadDir": "~/Downloads",
                    "taildropEnabled": true,
                    "taildropReceiveMode": "operator",
                    "terminalCommand": ""
                  },
                  "id": "plugin:tailscale"
                },
                {
                  "clockColor": "primary",
                  "customFont": "Inter ExtraBold",
                  "formatHorizontal": "HH:mm",
                  "formatVertical": "HH mm — dd MM",
                  "id": "Clock",
                  "tooltipFormat": "HH:mm ddd, MMM dd",
                  "useCustomFont": true
                },
                {
                  "deviceNativePath": "__default__",
                  "displayMode": "graphic",
                  "hideIfIdle": false,
                  "hideIfNotDetected": true,
                  "id": "Battery",
                  "showNoctaliaPerformance": false,
                  "showPowerProfiles": false
                },
                {
                  "hideWhenZero": false,
                  "hideWhenZeroUnread": false,
                  "iconColor": "none",
                  "id": "NotificationHistory",
                  "showUnreadBadge": true,
                  "unreadBadgeColor": "primary"
                },
                {
                  "defaultSettings": {
                    "activeColor": "primary",
                    "enableToast": true,
                    "hideInactive": false,
                    "iconSpacing": 4,
                    "inactiveColor": "none",
                    "micFilterRegex": "",
                    "removeMargins": false
                  },
                  "id": "plugin:privacy-indicator"
                }
              ]
            }
          }
        ]
      },
      "general": {
        "avatarImage": "/home/hezaki/Downloads/Media/Pictures/icon.jpg",
        "dimmerOpacity": 0,
        "showScreenCorners": true,
        "forceBlackScreenCorners": true,
        "scaleRatio": 1,
        "radiusRatio": 1,
        "iRadiusRatio": 1,
        "boxRadiusRatio": 1,
        "screenRadiusRatio": 0.45,
        "animationSpeed": 1.11,
        "animationDisabled": false,
        "compactLockScreen": false,
        "lockScreenAnimations": true,
        "lockOnSuspend": true,
        "showSessionButtonsOnLockScreen": false,
        "showHibernateOnLockScreen": false,
        "enableLockScreenMediaControls": true,
        "enableShadows": true,
        "enableBlurBehind": true,
        "shadowDirection": "center",
        "shadowOffsetX": 0,
        "shadowOffsetY": 0,
        "language": "",
        "allowPanelsOnScreenWithoutBar": true,
        "showChangelogOnStartup": true,
        "telemetryEnabled": false,
        "enableLockScreenCountdown": true,
        "lockScreenCountdownDuration": 10000,
        "autoStartAuth": true,
        "allowPasswordWithFprintd": true,
        "clockStyle": "custom",
        "clockFormat": "HH:mm",
        "passwordChars": true,
        "lockScreenMonitors": [],
        "lockScreenBlur": 1,
        "lockScreenTint": 0,
        "keybinds": {
          "keyUp": [
            "Up"
          ],
          "keyDown": [
            "Down"
          ],
          "keyLeft": [
            "Left"
          ],
          "keyRight": [
            "Right"
          ],
          "keyEnter": [
            "Return",
            "Enter"
          ],
          "keyEscape": [
            "Esc"
          ],
          "keyRemove": [
            "Del"
          ]
        },
        "reverseScroll": true,
        "smoothScrollEnabled": true
      },
      "ui": {
        "fontDefault": "Inter",
        "fontFixed": "Inter",
        "fontDefaultScale": 1,
        "fontFixedScale": 1,
        "tooltipsEnabled": true,
        "scrollbarAlwaysVisible": true,
        "boxBorderEnabled": false,
        "panelBackgroundOpacity": 1,
        "translucentWidgets": false,
        "panelsAttachedToBar": true,
        "settingsPanelMode": "centered",
        "settingsPanelSideBarCardStyle": false
      },
      "location": {
        "name": "Samara, RU",
        "weatherEnabled": true,
        "weatherShowEffects": true,
        "weatherTaliaMascotAlways": false,
        "useFahrenheit": false,
        "use12hourFormat": false,
        "showWeekNumberInCalendar": true,
        "showCalendarEvents": true,
        "showCalendarWeather": true,
        "analogClockInCalendar": false,
        "firstDayOfWeek": 1,
        "hideWeatherTimezone": true,
        "hideWeatherCityName": true,
        "autoLocate": false
      },
      "calendar": {
        "cards": [
          {
            "enabled": true,
            "id": "calendar-header-card"
          },
          {
            "enabled": true,
            "id": "calendar-month-card"
          },
          {
            "enabled": false,
            "id": "weather-card"
          }
        ]
      },
      "wallpaper": {
        "enabled": true,
        "overviewEnabled": true,
        "directory": "/home/hezaki/Pictures/Wallpapers",
        "monitorDirectories": [
          {
            "directory": "/home/hezaki/.config/nixos-touka/home/hezaki/themes/images",
            "name": "eDP-1",
            "wallpaper": ""
          }
        ],
        "enableMultiMonitorDirectories": false,
        "showHiddenFiles": false,
        "viewMode": "browse",
        "setWallpaperOnAllMonitors": true,
        "linkLightAndDarkWallpapers": true,
        "fillMode": "crop",
        "fillColor": "#000000",
        "useSolidColor": false,
        "solidColor": "#1a1a2e",
        "automationEnabled": false,
        "wallpaperChangeMode": "random",
        "randomIntervalSec": 300,
        "transitionDuration": 1500,
        "transitionType": [
          "disc"
        ],
        "skipStartupTransition": false,
        "transitionEdgeSmoothness": 0.05,
        "panelPosition": "follow_bar",
        "hideWallpaperFilenames": false,
        "useOriginalImages": false,
        "overviewBlur": 0.6,
        "overviewTint": 0.4,
        "useWallhaven": false,
        "wallhavenQuery": "",
        "wallhavenSorting": "relevance",
        "wallhavenOrder": "desc",
        "wallhavenCategories": "111",
        "wallhavenPurity": "100",
        "wallhavenRatios": "",
        "wallhavenApiKey": "",
        "wallhavenResolutionMode": "atleast",
        "wallhavenResolutionWidth": "",
        "wallhavenResolutionHeight": "",
        "sortOrder": "date_asc",
        "favorites": []
      },
      "appLauncher": {
        "enableClipboardHistory": true,
        "autoPasteClipboard": true,
        "enableClipPreview": true,
        "clipboardWrapText": true,
        "enableClipboardSmartIcons": true,
        "enableClipboardChips": true,
        "clipboardWatchTextCommand": "wl-paste --type text --watch cliphist store",
        "clipboardWatchImageCommand": "wl-paste --type image --watch cliphist store",
        "position": "center",
        "pinnedApps": [],
        "sortByMostUsed": true,
        "terminalCommand": "kitty -e",
        "customLaunchPrefixEnabled": false,
        "customLaunchPrefix": "",
        "viewMode": "list",
        "showCategories": false,
        "iconMode": "native",
        "showIconBackground": false,
        "enableSettingsSearch": false,
        "enableWindowsSearch": true,
        "enableSessionSearch": false,
        "ignoreMouseInput": false,
        "screenshotAnnotationTool": "",
        "overviewLayer": true,
        "density": "comfortable"
      },
      "controlCenter": {
        "position": "close_to_bar_button",
        "diskPath": "/",
        "shortcuts": {
          "left": [
            {
              "id": "Network"
            },
            {
              "id": "Bluetooth"
            },
            {
              "id": "WallpaperSelector"
            },
            {
              "id": "NoctaliaPerformance"
            }
          ],
          "right": [
            {
              "id": "Notifications"
            },
            {
              "id": "KeepAwake"
            },
            {
              "id": "NightLight"
            },
            {
              "defaultSettings": {
                "audioCodec": "opus",
                "audioSource": "default_output",
                "colorRange": "limited",
                "copyToClipboard": false,
                "directory": "",
                "filenamePattern": "recording_yyyyMMdd_HHmmss",
                "frameRate": "60",
                "hideInactive": false,
                "iconColor": "none",
                "quality": "very_high",
                "resolution": "original",
                "showCursor": true,
                "videoCodec": "h264",
                "videoSource": "portal"
              },
              "id": "plugin:screen-recorder"
            }
          ]
        },
        "cards": [
          {
            "enabled": true,
            "id": "profile-card"
          },
          {
            "enabled": true,
            "id": "shortcuts-card"
          },
          {
            "enabled": true,
            "id": "weather-card"
          },
          {
            "enabled": false,
            "id": "audio-card"
          },
          {
            "enabled": false,
            "id": "brightness-card"
          },
          {
            "enabled": false,
            "id": "media-sysmon-card"
          }
        ]
      },
      "systemMonitor": {
        "cpuWarningThreshold": 80,
        "cpuCriticalThreshold": 90,
        "tempWarningThreshold": 80,
        "tempCriticalThreshold": 90,
        "gpuWarningThreshold": 80,
        "gpuCriticalThreshold": 90,
        "memWarningThreshold": 80,
        "memCriticalThreshold": 90,
        "swapWarningThreshold": 80,
        "swapCriticalThreshold": 90,
        "diskWarningThreshold": 80,
        "diskCriticalThreshold": 90,
        "diskAvailWarningThreshold": 20,
        "diskAvailCriticalThreshold": 10,
        "batteryWarningThreshold": 20,
        "batteryCriticalThreshold": 5,
        "enableDgpuMonitoring": false,
        "useCustomColors": false,
        "warningColor": "",
        "criticalColor": "",
        "externalMonitor": "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor"
      },
      "noctaliaPerformance": {
        "disableWallpaper": true,
        "disableDesktopWidgets": true
      },
      "dock": {
        "enabled": false,
        "position": "top",
        "displayMode": "auto_hide",
        "dockType": "floating",
        "backgroundOpacity": 1,
        "floatingRatio": 1,
        "size": 1,
        "onlySameOutput": true,
        "monitors": [],
        "pinnedApps": [],
        "colorizeIcons": false,
        "showLauncherIcon": false,
        "launcherPosition": "end",
        "launcherUseDistroLogo": false,
        "launcherIcon": "",
        "launcherIconColor": "none",
        "pinnedStatic": false,
        "inactiveIndicators": false,
        "groupApps": false,
        "groupContextMenuMode": "extended",
        "groupClickAction": "cycle",
        "groupIndicatorStyle": "dots",
        "deadOpacity": 0.6,
        "animationSpeed": 1,
        "sitOnFrame": false,
        "showDockIndicator": false,
        "indicatorThickness": 3,
        "indicatorColor": "primary",
        "indicatorOpacity": 0.6
      },
      "network": {
        "bluetoothRssiPollingEnabled": true,
        "bluetoothRssiPollIntervalMs": 60000,
        "networkPanelView": "wifi",
        "wifiDetailsViewMode": "grid",
        "bluetoothDetailsViewMode": "grid",
        "bluetoothHideUnnamedDevices": false,
        "disableDiscoverability": false,
        "bluetoothAutoConnect": true
      },
      "sessionMenu": {
        "enableCountdown": false,
        "countdownDuration": 1000,
        "position": "center",
        "showHeader": true,
        "showKeybinds": true,
        "largeButtonsStyle": true,
        "largeButtonsLayout": "grid",
        "powerOptions": [
          {
            "action": "lock",
            "command": "",
            "countdownEnabled": true,
            "enabled": true,
            "keybind": "1"
          },
          {
            "action": "suspend",
            "command": "",
            "countdownEnabled": true,
            "enabled": true,
            "keybind": "2"
          },
          {
            "action": "hibernate",
            "command": "",
            "countdownEnabled": true,
            "enabled": false,
            "keybind": ""
          },
          {
            "action": "reboot",
            "command": "",
            "countdownEnabled": true,
            "enabled": true,
            "keybind": "3"
          },
          {
            "action": "logout",
            "command": "",
            "countdownEnabled": true,
            "enabled": true,
            "keybind": "4"
          },
          {
            "action": "shutdown",
            "command": "",
            "countdownEnabled": false,
            "enabled": true,
            "keybind": "5"
          },
          {
            "action": "rebootToUefi",
            "command": "",
            "countdownEnabled": true,
            "enabled": true,
            "keybind": "6"
          },
          {
            "action": "userspaceReboot",
            "command": "",
            "countdownEnabled": true,
            "enabled": false,
            "keybind": ""
          }
        ]
      },
      "notifications": {
        "enabled": true,
        "enableMarkdown": false,
        "density": "default",
        "monitors": [],
        "location": "bottom_right",
        "overlayLayer": false,
        "backgroundOpacity": 1,
        "respectExpireTimeout": false,
        "lowUrgencyDuration": 3,
        "normalUrgencyDuration": 8,
        "criticalUrgencyDuration": 15,
        "clearDismissed": true,
        "saveToHistory": {
          "low": true,
          "normal": true,
          "critical": true
        },
        "sounds": {
          "enabled": true,
          "volume": 0.3,
          "separateSounds": false,
          "criticalSoundFile": "",
          "normalSoundFile": "",
          "lowSoundFile": "",
          "excludedApps": "discord,firefox,chrome,chromium,edge"
        },
        "enableMediaToast": false,
        "enableKeyboardLayoutToast": true,
        "enableBatteryToast": true
      },
      "osd": {
        "enabled": true,
        "location": "bottom",
        "autoHideMs": 2000,
        "overlayLayer": true,
        "backgroundOpacity": 1,
        "enabledTypes": [
          0,
          1,
          2
        ],
        "monitors": []
      },
      "audio": {
        "volumeStep": 5,
        "volumeOverdrive": false,
        "spectrumFrameRate": 30,
        "visualizerType": "linear",
        "spectrumMirrored": true,
        "mprisBlacklist": [],
        "preferredPlayer": "",
        "volumeFeedback": false,
        "volumeFeedbackSoundFile": ""
      },
      "brightness": {
        "brightnessStep": 5,
        "enforceMinimum": true,
        "enableDdcSupport": true,
        "backlightDeviceMappings": []
      },
      "colorSchemes": {
        "useWallpaperColors": true,
        "predefinedScheme": "Catppuccin",
        "darkMode": true,
        "schedulingMode": "off",
        "manualSunrise": "06:30",
        "manualSunset": "18:30",
        "generationMethod": "tonal-spot",
        "monitorForColors": "",
        "syncGsettings": true
      },
      "templates": {
        "activeTemplates": [
          {
            "enabled": true,
            "id": "telegram"
          }
        ],
        "enableUserTheming": false
      },
      "nightLight": {
        "enabled": false,
        "forced": false,
        "autoSchedule": true,
        "nightTemp": "4000",
        "dayTemp": "6500",
        "manualSunrise": "06:30",
        "manualSunset": "18:30"
      },
      "hooks": {
        "enabled": false,
        "wallpaperChange": "",
        "darkModeChange": "",
        "screenLock": "",
        "screenUnlock": "",
        "performanceModeEnabled": "",
        "performanceModeDisabled": "",
        "startup": "",
        "session": "",
        "colorGeneration": ""
      },
      "plugins": {
        "autoUpdate": false,
        "notifyUpdates": true
      },
      "idle": {
        "enabled": true,
        "screenOffTimeout": 600,
        "lockTimeout": 660,
        "suspendTimeout": 1800,
        "fadeDuration": 5,
        "screenOffCommand": "",
        "lockCommand": "",
        "suspendCommand": "",
        "resumeScreenOffCommand": "",
        "resumeLockCommand": "",
        "resumeSuspendCommand": "",
        "customCommands": "[]"
      },
      "desktopWidgets": {
        "enabled": true,
        "overviewEnabled": true,
        "gridSnap": true,
        "gridSnapScale": true,
        "monitorWidgets": [
          {
            "name": "DP-2",
            "widgets": []
          }
        ]
      }
    }
  '';
}
