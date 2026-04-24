{ config, ... }:

{
  programs.rofi.enable = true;

  xdg.configFile = {
    "rofi/config.rasi".text = # rasi
      ''
        configuration {
        	modi:                       "drun";
          show-icons:                 true;
          display-drun:               " ";
          display-clipboard:          " ";
        	drun-display-format:        "{name}";
        }
      '';

    "rofi/theme.rasi".text =
      with config.lib.stylix.colors; # rasi
      ''
        * {
            font: "Inter 12";
            background:     #${base00};
            background-alt: #${base02};
            foreground:     #${base05};
            selected:       #${base01};
            active:         #21FF90FF;
            urgent:         #${base08};
        }
      '';

    "rofi/launcher.rasi".text = # rasi
      ''
        @theme "./theme.rasi"

        window {
            transparency:                "real";
            location:                    center;
            anchor:                      center;
            fullscreen:                  false;
            width:                       750px;
            x-offset:                    0px;
            y-offset:                    0px;

            enabled:                     true;
            margin:                      0px;
            padding:                     0px;
            border:                      1px solid;
            border-radius:               20px;
            border-color:                @selected;
            background-color:            black / 10%;
            cursor:                      "default";
        }

        mainbox {
            enabled:                     true;
            spacing:                     20px;
            margin:                      0px;
            padding:                     20px;
            border:                      0px solid;
            border-radius:               0px 0px 0px 0px;
            border-color:                @selected;
            background-color:            @background;
            children:                    [ "inputbar", "listview" ];
        }

        inputbar {
            enabled:                     true;
            spacing:                     10px;
            margin:                      0px;
            padding:                     15px;
            border:                      0px solid;
            border-radius:               8px;
            border-color:                @selected;
            background-color:            white / 5%;
            text-color:                  @foreground;
            children:                    [ "prompt", "entry" ];
        }

        prompt {
            enabled:                     true;
            background-color:            @selected;
            text-color:                  inherit;
        }
        textbox-prompt-colon {
            enabled:                     true;
            expand:                      false;
            str:                         "::";
            background-color:            transparent;
            text-color:                  inherit;
        }
        entry {
            enabled:                     true;
            background-color:            transparent;
            text-color:                  inherit;
            cursor:                      text;
            placeholder:                 "Search";
            placeholder-color:           inherit;
        }

        listview {
            enabled:                     true;
            columns:                     5;
            lines:                       3;
            cycle:                       true;
            dynamic:                     true;
            scrollbar:                   false;
            layout:                      vertical;
            reverse:                     false;
            fixed-height:                true;
            fixed-columns:               true;
            
            spacing:                     0px;
            margin:                      0px;
            padding:                     0px;
            border:                      0px solid;
            border-radius:               0px;
            border-color:                @selected;
            background-color:            transparent;
            text-color:                  @foreground;
            cursor:                      "default";
        }
        scrollbar {
            handle-width:                5px ;
            handle-color:                @selected;
            border-radius:               0px;
            background-color:            @background-alt;
        }

        element {
            enabled:                     true;
            spacing:                     15px;
            margin:                      0px;
            padding:                     20px 10px;
            border:                      0px solid;
            border-radius:               8px;
            border-color:                @selected;
            background-color:            transparent;
            text-color:                  @foreground;
            orientation:                 vertical;
            cursor:                      pointer;
        }
        element normal.normal {
            background-color:            transparent;
            text-color:                  @foreground;
        }
        element selected.normal {
            background-color:            white / 5%;
            text-color:                  @foreground;
        }
        element-icon {
            background-color:            transparent;
            text-color:                  inherit;
            size:                        64px;
            cursor:                      inherit;
        }
        element-text {
            background-color:            transparent;
            text-color:                  inherit;
            highlight:                   inherit;
            cursor:                      inherit;
            vertical-align:              0.5;
            horizontal-align:            0.5;
        }

        element alternate.normal {
            background-color: transparent;
        }

        error-message {
            padding:                     15px;
            border:                      2px solid;
            border-radius:               8px;
            border-color:                @selected;
            background-color:            black / 10%;
            text-color:                  @foreground;
        }
        textbox {
            background-color:            transparent;
            text-color:                  @foreground;
            vertical-align:              0.5;
            horizontal-align:            0.0;
            highlight:                   none;
        }
      '';

    "rofi/clipboard.rasi".text = # rasi
      ''
        @theme "./theme.rasi"

        window {
            transparency:                "real";
            location:                    center;
            anchor:                      center;
            fullscreen:                  false;
            width:                       550px;
            x-offset:                    0px;
            y-offset:                    0px;

            enabled:                     true;
            margin:                      0px;
            padding:                     0px;
            border:                      2px solid;
            border-radius:               8px;
            border-color:                @selected;
            background-color:            black / 10%;
            cursor:                      "default";
        }

        mainbox {
            enabled:                     true;
            spacing:                     20px;
            margin:                      0px;
            padding:                     20px;
            border:                      0px solid;
            border-radius:               0px 0px 0px 0px;
            border-color:                @selected;
            background-color:            @background;
            children:                    [ "inputbar", "listview" ];
        }

        inputbar {
            enabled:                     true;
            spacing:                     10px;
            margin:                      0px;
            padding:                     15px;
            border:                      0px solid;
            border-radius:               8px;
            border-color:                @selected;
            background-color:            white / 5%;
            text-color:                  @foreground;
            children:                    [ "prompt", "entry" ];
        }

        prompt {
            enabled:                     true;
            background-color:            @selected;
            text-color:                  inherit;
        }
        textbox-prompt-colon {
            enabled:                     true;
            expand:                      false;
            str:                         "::";
            background-color:            transparent;
            text-color:                  inherit;
        }
        entry {
            enabled:                     true;
            background-color:            transparent;
            text-color:                  inherit;
            cursor:                      text;
            placeholder:                 "Search";
            placeholder-color:           inherit;
        }

        listview {
            enabled:                     true;
            columns:                     1;
            lines:                       10;
            cycle:                       true;
            dynamic:                     true;
            scrollbar:                   false;
            layout:                      vertical;
            reverse:                     false;
            fixed-height:                true;
            fixed-columns:               true;
            
            spacing:                     0px;
            margin:                      0px;
            padding:                     0px;
            border:                      0px solid;
            border-radius:               0px;
            border-color:                @selected;
            background-color:            transparent;
            text-color:                  @foreground;
            cursor:                      "default";
        }

        scrollbar {
            handle-width:                5px ;
            handle-color:                @selected;
            border-radius:               0px;
            background-color:            @background-alt;
        }

        element {
            enabled:                     true;
            padding:                     10px 10px;
            border:                      0px solid;
            border-radius:               8px;
            border-color:                @selected;
            background-color:            transparent;
            text-color:                  @foreground;
            cursor:                      pointer;
        }
        element normal.normal {
            background-color:            transparent;
            text-color:                  @foreground;
        }
        element selected.normal {
            background-color:            white / 5%;
            text-color:                  @foreground;
        }
        element-icon {
            background-color:            transparent;
            text-color:                  inherit;
            cursor:                      inherit;
        }
        element-text {
            background-color:            transparent;
            text-color:                  inherit;
            highlight:                   inherit;
            cursor:                      inherit;
        }

        element alternate.normal {
            background-color: transparent;
        }

        error-message {
            padding:                     15px;
            border:                      2px solid;
            border-radius:               8px;
            border-color:                @selected;
            background-color:            black / 10%;
            text-color:                  @foreground;
        }
        textbox {
            background-color:            transparent;
            text-color:                  @foreground;
            vertical-align:              0.5;
            horizontal-align:            0.0;
            highlight:                   none;
        }
      '';
  };
}
