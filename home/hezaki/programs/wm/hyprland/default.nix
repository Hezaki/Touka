{ inputs, pkgs, lib, ... }: let
  mkGraphicalService = lib.recursiveUpdate {
    Unit.PartOf = ["graphical-session.target"];
    Unit.After = ["graphical-session.target"];
    Install.WantedBy = ["graphical-session.target"];
  };
in {
  home.packages = [ pkgs.wl-clipboard ];

  systemd.user.services = {
    cliphist = mkGraphicalService {
      Unit.Description = "Clipboard history service";
      Service = {
        ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/sliphist store";
        Restart = "always";
      };
    };

    wl-clip-persist = mkGraphicalService {
      Unit.Description = "Persistent clipboard for Wayland";
      Service = {
        ExecStart = "${pkgs.wl-clip-persist}/bin/wl-clip-persist --clipboard both";
        Restart = "always";
      };
    };
  };

  home.file = {
    ".config/hypr/hyprland.conf".source = ./hyprland.conf;
    ".config/hypr/settings.conf".source = ./settings.conf;
    ".config/hypr/decoration.conf".source = ./decoration.conf;
    ".config/hypr/autostat.sh".source = ./autostart.sh;
    ".config/hypr/binds.conf".source = ./binds.conf;
    ".config/hypr/rules.conf".source = ./rules.conf;
  };
}
