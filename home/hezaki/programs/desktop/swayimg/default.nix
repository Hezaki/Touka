{ pkgs, config, ... }:
{
  home.packages = with pkgs; [ swayimg ];
  xdg.configFile."swayimg/config".text = with config.lib.stylix.colors; ''
    [general]
    mode = viewer
    position = parent
    size = parent
    sigusr1 = reload
    sigusr2 = next_file
    app_id = swayimg

    [viewer]
    window = #${base00}
    transparency = RGBA
    scale = fit 
    position = center
    fixed = yes
    antialiasing = yes
    slideshow = no
    slideshow_time = 3
    history = 1
    preload = 1

    [gallery]
    size = 200
    cache = 100
    fill = yes
    antialiasing = yes
    window = #${base00}
    background = #${base01}
    select = #${base03}
    border = #${base0D}
    shadow = #${base01}

    [list]
    order = alpha
    loop = yes
    recursive = no
    all = yes

    [font]
    name = JetBrainsMono
    size = 12
    # Font color (RGBA)
    color = #{base05}
    # Shadow color (RGBA)
    shadow = #000000d0
    # Background color (RGBA)
    background = #00000000

    [info]
    show = no
    info_timeout = 5
    status_timeout = 3

    [info.viewer]
    top_left = +name,+format,+filesize,+imagesize,+exif
    top_right = index
    bottom_left = scale,frame
    bottom_right = status

    [info.gallery]
    top_left = none
    top_right = none
    bottom_left = none
    bottom_right = name,status

    [keys.viewer]
    F1 = help
    h = prev_file
    l = next_file
    d = next_dir
    Shift+o = prev_frame
    o = next_frame
    c = skip_file
    Shift+s = slideshow
    s = animation
    Return = mode
    Left = step_left 10
    Right = step_right 10
    Up = step_up 10
    Down = step_down 10
    Equal = zoom +10
    Plus = zoom +10
    Minus = zoom -10
    w = zoom width
    Shift+w = zoom height
    z = zoom fit
    Shift+z = zoom fill
    0 = zoom real
    BackSpace = zoom optimal
    Shift+f = scale
    bracketleft = rotate_left
    bracketright = rotate_right
    m = flip_vertical
    Shift+m = flip_horizontal
    a = antialiasing
    r = reload
    i = info
    Shift+Delete = exec rm "%"; skip_file
    Escape = exit

    [keys.gallery]
    F1 = help
    g = first_file
    Shift+g = last_file
    h = step_left
    l = step_right
    k = step_up
    j = step_down
    c = skip_file
    Return = mode
    a = antialiasing
    r = reload
    i = info
    Shift+Delete = exec rm "%"; skip_file
    Escape = exit
  '';
}
