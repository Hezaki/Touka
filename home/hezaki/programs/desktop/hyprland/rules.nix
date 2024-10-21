{
  xdg.configFile."hypr/rules.conf".text = ''
    windowrule = size 482 271, title:^(Picture-in-Picture)$
    windowrule = move 14 12, title:^(Picture-in-Picture)$
    windowrule = float, title:^(Picture-in-Picture)$
    windowrule = move center 1, .telegram-desktop-wrapped
    windowrule = size 1331 810, .telegram-desktop-wrapped
    windowrule = move center 1, title:^(Open Files)$
    windowrule = size 1331 810, title:^(Open Files)$
    windowrule = size 1331 810, title:^(Open File)$
    windowrule = move center 1, title:^(Open File)$
    windowrule = workspace 2, firefox
    windowrule = workspace 3, io.github.tdesktop_x64.TDesktop
    windowrule = workspace 4, vesktop 
    windowrule = workspace 5, org.prismlauncher.PrismLauncher
    windowrule = workspace 5, Badlion Client
    windowrule = workspace 5, libreoffice-writer
    windowrule = workspace 5, title:^(Steam)$
    windowrule = workspace 5, lutris
    windowrule = workspace 6, org.pwmt.zathura 
    windowrule = workspace 7, com.github.wwmm.easyeffects 
    windowrule = workspace 7, com.github.wwmm.easyeffects 
    windowrule = workspace 7, com.github.wwmm.easyeffects 
    windowrule = workspace 8, blender
    windowrule = workspace 8, Blockbench
    windowrule = workspace 9, transmission-gtk
    windowrule = workspace 10, obsidian
  '';
}
