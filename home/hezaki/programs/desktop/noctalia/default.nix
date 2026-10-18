{ inputs, ... }:
{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
  };

  home.file.".local/state/noctalia/settings.toml".text = ''
    config_version = 15

    [accessibility]
    ui_scale = 1.2000000104308128

    [audio]
    enable_overdrive = true
    enable_sounds = true
    sound_volume = 0.24999999441206455

    [backdrop]
    enabled = true
    tint_intensity = 0.4999999888241291

    [bar.default]
    border = "on_secondary"
    compositor_blur = false
    contact_shadow = true
    end = [ "audio_visualizer", "media", "tray", "keyboard_layout", "group:g1", "notifications" ]
    margin_ends = 200
    padding = 12
    position = "left"
    radius = 80
    scale = 1.2500000111758709
    start = [ "control-center", "workspaces", "active_window" ]
    thickness = 40

        [bar.default.monitor.eDP-1]
        margin_ends = 100

        [[bar.default.capsule_group]]
        accordion = false
        accordion_direction = "end"
        border_width = 1.0
        enabled = true
        fill = "surface_variant"
        id = "g1"
        members = [ "brightness", "output_volume", "input_volume", "bluetooth", "network" ]
        opacity = 1.0
        padding = 6.0

    [brightness]
    enable_ddcutil = true

    [calendar]

    [control_center]
    show_session_button = false
    show_shortcut_labels = false
    sidebar_section = "none"

        [control_center.calendar]
        show_events_card = false

    [desktop_widgets]
    enabled = false
    schema_version = 2
    widget_order = []

        [desktop_widgets.grid]
        cell_size = 16
        major_interval = 4
        visible = true

        [desktop_widgets.widget]

    [dock]
    background_opacity = 0.79999998211860657
    concave_edge_corners = false
    launcher_custom_image_colorize = true
    launcher_position = "start"
    layer = "overlay"
    pinned = [
        "com.mitchellh.ghostty",
        "zen-twilight",
        "helium",
        "obsidian",
        "com.ayugram.desktop",
        "equibop",
        "steam",
        "com.belmoussaoui.Authenticator",
        "org.bleachbit.BleachBit",
        "org.gnome.Nautilus"
    ]
    reserve_space = false
    show_dots = true
    smart_auto_hide = true

    [hot_corners.top_left]
    action = "launcher"

    [idle]
    behavior_order = [ "lock", "screen-off", "lock-and-suspend" ]

        [idle.behavior.lock]
        action = "lock"
        enabled = true
        timeout = 600.0

        [idle.behavior.lock-and-suspend]
        action = "lock_and_suspend"
        enabled = true
        timeout = 900.0

        [idle.behavior.screen-off]
        action = "screen_off"
        enabled = true
        timeout = 660.0

    [lockscreen]
    allow_empty_password = true
    fingerprint = false
    monitors = [ "DP-2" ]
    transition = [ "zoom" ]

    [lockscreen_widgets]
    enabled = true
    schema_version = 2
    widget_order = [
        "lockscreen-login-box@DP-1",
        "lockscreen-login-box@eDP-1",
        "lockscreen-widget-0000000000000001",
        "lockscreen-login-box@DP-2",
        "lockscreen-widget-0000000000000002",
        "lockscreen-widget-0000000000000003",
        "lockscreen-widget-0000000000000004"
    ]

        [lockscreen_widgets.grid]
        cell_size = 8
        major_interval = 4
        visible = true

        [lockscreen_widgets.widget."lockscreen-login-box@DP-1"]
        box_height = 196.0
        box_width = 810.0
        cx = 1720.0
        cy = 1258.0
        output = "DP-1"
        placement_height = 1440.0
        placement_width = 3440.0
        rotation = 0.0
        type = "login_box"

            [lockscreen_widgets.widget."lockscreen-login-box@DP-1".settings]
            background_color = "surface_variant"
            background_opacity = 0.88
            background_radius = 12.0
            center_password_text = false
            input_opacity = 1.0
            input_radius = 6.0
            layout = "regular"
            show_caps_lock = true
            show_keyboard_layout = true
            show_login_button = true
            show_media = true
            show_password_reveal = true
            show_session_buttons = true
            show_unlock_hint = true
            show_weather = true

        [lockscreen_widgets.widget."lockscreen-login-box@DP-2"]
        box_height = 70.0
        box_width = 400.0
        cx = 1720.0
        cy = 720.0
        output = "DP-2"
        placement_height = 1440.0
        placement_width = 3440.0
        rotation = 0.0
        type = "login_box"

            [lockscreen_widgets.widget."lockscreen-login-box@DP-2".settings]
            background_color = "surface_variant"
            background_opacity = 0.0
            background_radius = 32.0
            center_password_text = true
            input_opacity = 1.0
            input_radius = 32.0
            layout = "compact"
            show_caps_lock = true
            show_keyboard_layout = true
            show_login_button = false
            show_media = true
            show_password_reveal = true
            show_session_buttons = true
            show_unlock_hint = false
            show_weather = true

        [lockscreen_widgets.widget."lockscreen-login-box@eDP-1"]
        box_height = 196.0
        box_width = 810.0
        cx = 960.0001220703125
        cy = 716.0
        output = "eDP-1"
        placement_height = 1080.0
        placement_width = 1920.0
        rotation = 0.0
        type = "login_box"

            [lockscreen_widgets.widget."lockscreen-login-box@eDP-1".settings]
            background_color = "surface_variant"
            background_opacity = 0.88
            background_radius = 12.0
            center_password_text = false
            input_opacity = 1.0
            input_radius = 6.0
            layout = "regular"
            show_caps_lock = true
            show_keyboard_layout = true
            show_login_button = true
            show_media = true
            show_password_reveal = true
            show_session_buttons = true
            show_unlock_hint = true
            show_weather = true

        [lockscreen_widgets.widget.lockscreen-widget-0000000000000001]
        box_height = 384.0
        box_width = 704.0
        cx = 1720.0
        cy = 493.0
        output = "DP-2"
        placement_height = 1440.0
        placement_width = 3440.0
        rotation = 0.0
        type = "clock"

            [lockscreen_widgets.widget.lockscreen-widget-0000000000000001.settings]
            background_color = "on_secondary"
            background_opacity = 0.0
            background_padding = 0
            background_radius = 32
            center_text = true
            clock_style = "digital"
            color = "primary"
            font_family = "Halant SemiBold"
            format = "{:%H:%M}"
            shadow = false
            timezone = ""

        [lockscreen_widgets.widget.lockscreen-widget-0000000000000002]
        box_height = 128.0
        box_width = 256.0
        cx = 1720.0
        cy = 621.0
        output = "DP-2"
        placement_height = 1440.0
        placement_width = 3440.0
        rotation = -0.0
        type = "clock"

            [lockscreen_widgets.widget.lockscreen-widget-0000000000000002.settings]
            background_color = "on_secondary"
            background_opacity = 0.0
            background_padding = 0
            background_radius = 32
            center_text = true
            clock_style = "digital"
            color = "primary"
            font_family = ""
            format = "{:%A, %d %B}"
            shadow = true
            timezone = ""

        [lockscreen_widgets.widget.lockscreen-widget-0000000000000003]
        box_height = 256.0
        box_width = 256.0
        cx = 144.0
        cy = 1296.0
        output = "DP-2"
        placement_height = 1440.0
        placement_width = 3440.0
        rotation = 0.0
        type = "sticker"

            [lockscreen_widgets.widget.lockscreen-widget-0000000000000003.settings]
            background_opacity = 0.0
            background_padding = 0
            background_radius = 0
            image_path = "/home/hezaki/Downloads/Pictures/Antifalogo_alt2.svg"
            opacity = 0.90000000000000002

        [lockscreen_widgets.widget.lockscreen-widget-0000000000000004]
        box_height = 184.0
        box_width = 432.0
        cx = 464.0
        cy = 1340.0
        output = "DP-2"
        placement_height = 1440.0
        placement_width = 3440.0
        rotation = 0.0
        type = "sticker"

            [lockscreen_widgets.widget.lockscreen-widget-0000000000000004.settings]
            background_opacity = 0.0
            background_padding = 0
            background_radius = 0
            image_path = "/home/hezaki/Downloads/Pictures/gplv3_logo1.png"
            opacity = 0.90000000000000002

    [notification]
    background_opacity = 0.79999998211860657
    history_retention_hours = 24
    max_visible = 4
    offset_x = 13
    offset_y = 11
    position = "bottom_right"
    show_app_name = false

    [osd]
    background_opacity = 0.79999998211860657
    offset_y = 30
    position = "bottom_center"
    position_vertical = "bottom_center"

        [osd.kinds]
        keyboard_layout = false
        media = false
        privacy = false

    [plugin_settings."alexander/screen-toolkit"]
    record-copy-to-clipboard = true

    [plugin_settings."avivbintangaringga/nix-monitor"]
    branch = "nixos-26.05"

    [plugin_settings."icefish/phone-connect"]
    battery_display = "hidden"

    [plugin_settings."noctalia/wallhaven"]
    browser_placement = "floating"
    browser_position = "center"

    [plugins]
    enabled = []

    [shell]
    app_icon_color = "secondary"
    app_icon_colorize = true
    avatar_path = "/home/hezaki/Downloads/Pictures/icon.jpg"
    button_borders = false
    card_borders = false
    corner_radius_scale = 2.0
    font_family = "Inter"
    input_borders = false
    offline_mode = true
    panel_anchor_bar = "default"
    password_style = "random"
    show_close_buttons = false

        [shell.animation]
        speed = 1.0500000156462193

        [shell.launcher]
        auto_paste = "off"
        categories = false
        layout = "simple"
        show_app_actions = true

            [shell.launcher.panels]
            ignored = [ "polkit", "setup-wizard", "test", "launcher", "clipboard" ]

            [shell.launcher.providers.emoji]
            prefix = ""

            [shell.launcher.providers.session]
            global = false

            [shell.launcher.providers.wallpaper]
            global = false

            [shell.launcher.providers.windows]
            global = false

        [shell.panel]
        control_center_position = "center"
        floating_offset = 100
        list_item_background = true
        open_near_click_control_center = true
        session_placement = "floating"
        session_position = "center"
        transparency_mode = "soft"

        [shell.screen_corners]
        size = 28

        [shell.screenshot]
        confirm_region = true
        show_cursor = true

        [shell.session]
        grid = true
        grid_columns = 2

            [[shell.session.actions]]
            action = "logout"
            countdown_seconds = 0.0
            enabled = true
            shortcut = "1"
            variant = "default"

            [[shell.session.actions]]
            action = "lock_and_suspend"
            countdown_seconds = 0.0
            enabled = true
            shortcut = "2"
            variant = "default"

            [[shell.session.actions]]
            action = "reboot"
            countdown_seconds = 0.0
            enabled = true
            shortcut = "3"
            variant = "default"

            [[shell.session.actions]]
            action = "shutdown"
            countdown_seconds = 0.0
            enabled = true
            shortcut = "4"
            variant = "destructive"

            [[shell.session.actions]]
            action = "lock"
            countdown_seconds = 0.0
            enabled = false
            shortcut = "1"
            variant = "default"

            [[shell.session.actions]]
            action = "command"
            command = "notify-send 'Noctalia' 'Custom session entry'"
            countdown_seconds = 0.0
            enabled = false
            variant = "default"

        [shell.shadow]
        alpha = 0.99999997764825821
        direction = "center"

    [system.monitor]
    enabled = false

    [theme]
    builtin = "Noctalia"
    community_palette = "Oxocarbon"
    custom_palette = "_live_preview"
    source = "wallpaper"
    wallpaper_scheme = "m3-content"

        [theme.templates]
        community_ids = [ "discord" ]

    [wallpaper]
    directory = "/home/hezaki/Downloads"
    per_monitor_directories = true
    transition = [ "zoom" ]
    transition_on_startup = true

        [wallpaper.default]
        path = "/home/hezaki/Downloads/Pictures/wallhaven-j3w3mm.jpg"

        [wallpaper.last]
        path = "/home/hezaki/Downloads/Pictures/wallhaven-j3w3mm.jpg"

        [wallpaper.monitors.DP-2]
        path = "/home/hezaki/Downloads/Pictures/wallhaven-j3w3mm.jpg"

    [widget.active_window]
    display = "icon_only"
    max_length = 646
    min_length = 325
    scale = 1.05
    title_scroll = "always"

    [widget.audio_visualizer]
    bands = 12
    mirrored = false
    width = 30

    [widget.battery]
    show_label = false

    [widget.brightness]
    show_label = false

    [widget.clock]
    font_family = "JetBrains Mono"
    format = "{:%H:%M} — {:%d:%m}"

    [widget.control-center]
    capsule_padding = 3
    color = "primary"
    custom_image = "/home/hezaki/Downloads/StickerLogo/nix-snowflake-white.svg"
    custom_image_colorize = true
    glyph = ""
    scale = 1.1500000000000001

    [widget.input_volume]
    show_label = false

    [widget.keyboard_layout]
    font_family = "JetBrains Mono"
    show_glyph = false

    [widget.launcher]
    glyph = "noctalia"

    [widget.media]
    rotate_album_art = true
    scale = 1.2
    scroll_repeat = "gesture"
    title_scroll = "always"

    [widget.network]
    show_label = false

    [widget.output_volume]
    show_label = false

    [widget.sysmon]
    stat = "cpu_temp"

    [widget.taskbar]
    capsule_radius = 8
    group_by_workspace = true
    icon_scale = 0.90000000000000002
    show_workspace_label = false
    workspace_group_capsule = false

    [widget.tray]
    drawer = true

    [widget.weather]
    font_scale = 0.90000000000000013
    font_weight = 100
    interactive = false
    scale = 1.1500000000000001

    [widget.workspaces]
    active_pill_size = 1.9000000000000001
    capsule = true
    focused_output_only = true
    font_family = "JetBrains Mono"
    labels_only_when_occupied = true
    pill_scale = 0.90000000000000002
    show_all_outputs = true
  '';
}
