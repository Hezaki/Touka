{
  xdg.configFile."millennium/config.json" = {
    force = true;
    text = # json
      ''
        {
          "general": {
            "accentColor": "DEFAULT_ACCENT_COLOR",
            "checkForMillenniumUpdates": false,
            "checkForPluginAndThemeUpdates": false,
            "injectCSS": true,
            "injectJavascript": true,
            "millenniumUpdateChannel": "stable",
            "onMillenniumUpdate": 0,
            "shouldShowThemePluginUpdateNotifications": false
          },
          "misc": {
            "hasShownWelcomeModal": true
          },
          "network": {
            "proxy": "",
            "proxyPassword": "",
            "proxyUsername": ""
          },
          "notifications": {
            "showNotifications": true,
            "showPluginNotifications": true,
            "showUpdateNotifications": false
          },
          "plugins": {
            "enabledPlugins": [
              "extendium",
              "steam-easygrid",
              "protondb",
              "me.tysmith.steam-native-notifications",
              "recent-chats",
              "protondb-status",
              "gratitude"
            ]
          },
          "themes": {
            "activeTheme": "Material-Theme",
            "allowedScripts": true,
            "allowedStyles": true,
            "conditions": {
              "Material-Theme": {
                " - Show Balance in menu after Hover?": "yes",
                " - Show Balance near name after hover?": "yes",
                " - Show Name in account change after Hover?": "yes",
                " - Show Name in menu after Hover?": "yes",
                "Account Balance in Menu": "Blur",
                "Account Balance near Account Name": "Blur",
                "Account Name in Account Change": "Blur",
                "Account Name in Menu": "Blur",
                "Achievements Icons Shape": "Circle",
                "Animations": "Enabled",
                "Appearance": "Dark",
                "Background Opacity Slider": "100",
                "Background Opacity Toggle": "no",
                "Badges for Contributors": "yes",
                "Big Game Card Hover Animation": "Default",
                "Big Picture Mode Bottom Bar Style": "Floating",
                "Blur": "Enabled",
                "Blur Matured Content": "yes",
                "Bottom Bar Style": "Floating",
                "Chat Animations": "yes",
                "Color": "Matugen",
                "Custom/Dynamic Color Generation Style": "Fidelity",
                "Disable Max Hero Image Size": "no",
                "Font": "Open Sans",
                "Game Card Hover Animation": "Default",
                "Game Icons Shape": "Circle",
                "Groups/Curators Picture Shape": "Circle",
                "Hide Activity Posting": "yes",
                "Hide Add Shelf": "yes",
                "Hide Big Picture Mode Button": "no",
                "Hide Broadcasting Containers": "no",
                "Hide Left Sidebar": "yes",
                "Hide News Button": "no",
                "Hide Notifications Button": "no",
                "Hide Scrollbar": "no",
                "Hide URL Bar": "no",
                "Hide Window Control Buttons": "yes",
                "Icons": "Rounded",
                "Library Slide In Animation": "yes",
                "Loading Style": "Material Design",
                "Menu Style": "Expressive",
                "Online Indicator": "Alternative",
                "Online Status Color": "50",
                "Profile Force Default Theme": "no",
                "Profile Picture Shape": "Circle",
                "Profile VAC-Ban Visibility": "Show",
                "Rare Achievements based on Source Color": "yes",
                "Remove Shiny Effect": "no",
                "Ripple Effect": "yes",
                "Store Cash Related based on Source Color": "yes",
                "Store Header Always Visible": "yes",
                "Swap Dialog Buttons": "yes",
                "Toolbar Account": "Default",
                "Toolbar Icon": "Material Design",
                "Toolbar Title": "Only Icon",
                "Toolbar Title Based on Icon": "yes",
                "Use Experimental Features": "no",
                "Use Modifications File": "no",
                "What's New": "Compact"
              },
              "material-theme-steam": {
                " - Show Balance in menu after Hover?": "yes",
                " - Show Balance near name after hover?": "yes",
                " - Show Name in account change after Hover?": "yes",
                " - Show Name in menu after Hover?": "yes",
                "Account Balance in Menu": "Blur",
                "Account Balance near Account Name": "Blur",
                "Account Name in Account Change": "Blur",
                "Account Name in Menu": "Blur",
                "Achievements Icons Shape": "Circle",
                "Animations": "Enabled",
                "Appearance": "Dark",
                "Background Opacity Slider": "100",
                "Background Opacity Toggle": "no",
                "Badges for Contributors": "yes",
                "Big Game Card Hover Animation": "Default",
                "Big Picture Mode Bottom Bar Style": "Floating",
                "Blur": "Disabled",
                "Blur Matured Content": "yes",
                "Bottom Bar Style": "Floating",
                "Chat Animations": "yes",
                "Color": "Matugen",
                "Custom/Dynamic Color Generation Style": "Fidelity",
                "Disable Max Hero Image Size": "no",
                "Font": "Open Sans",
                "Game Card Hover Animation": "Default",
                "Game Icons Shape": "Circle",
                "Groups/Curators Picture Shape": "Circle",
                "Hide Activity Posting": "yes",
                "Hide Add Shelf": "yes",
                "Hide Big Picture Mode Button": "yes",
                "Hide Broadcasting Containers": "no",
                "Hide Left Sidebar": "yes",
                "Hide News Button": "no",
                "Hide Notifications Button": "no",
                "Hide Scrollbar": "yes",
                "Hide URL Bar": "no",
                "Hide Window Control Buttons": "no",
                "Icons": "Rounded",
                "Library Slide In Animation": "yes",
                "Loading Style": "Material Design",
                "Menu Style": "Expressive",
                "Online Indicator": "Alternative",
                "Online Status Color": "50",
                "Profile Force Default Theme": "no",
                "Profile Picture Shape": "Circle",
                "Profile VAC-Ban Visibility": "Show",
                "Rare Achievements based on Source Color": "yes",
                "Remove Shiny Effect": "yes",
                "Ripple Effect": "yes",
                "Store Cash Related based on Source Color": "yes",
                "Store Header Always Visible": "yes",
                "Swap Dialog Buttons": "yes",
                "Toolbar Account": "Default",
                "Toolbar Icon": "Material Design",
                "Toolbar Title": "Only Icon",
                "Toolbar Title Based on Icon": "yes",
                "Use Experimental Features": "no",
                "Use Modifications File": "no",
                "What's New": "Compact"
              }
            },
            "themeColors": {
              "Material-Theme": {
                "--custom-accent-color": "#4CB4FF"
              },
              "material-theme-steam": {
                "--custom-accent-color": "#4CB4FF"
              }
            }
          }
        }
      '';
  };
}
