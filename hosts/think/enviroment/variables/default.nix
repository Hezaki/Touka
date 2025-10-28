{
  environment = {
    variables = {
      XDG_CURRENT_DESKTOP = "niri";
      ROC_ENABLE_PRE_VEGA = "1";
      # XDG_CURRENT_DESKTOP = "Hyprland";
      # XDG_SESSION_TYPE = "wayland";
      # XDG_SESSION_DESKTOP = "Hyprland";
      # QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      # QT_QPA_PLATFORM = "wayland";
      # QT_WAYLAND_DISABLE_WINDOWDECORATION = "0";
      # SDL_VIDEODRIVER = "wayland";
      # _JAVA_AWT_WM_NONEREPARENTING = "1";
      # CLUTTER_BACKEND = "wayland";
      # GDK_BACKEND = "wayland";
      # HYPRLAND_LOG_WLR = "1";
      # GTK_USE_PORTAL = "1";
      # MOZ_ENABLE_WAYLAND = "1";
      # RUST_BACKTRACE = "1";
      VDPAU_DRIVER = "radeonsi";
      LIBVA_DRIVER_NAME = "radeonsi";
    };
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
