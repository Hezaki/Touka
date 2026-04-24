{ inputs, ... }:
{
  imports = with inputs; [ nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak = {
    enable = true;

    packages = [
      "pw.mmk.OpenFreebuds"
      "com.teamspeak.TeamSpeak3"
      "org.gnome.gitlab.cheywood.Pulp"
    ];

    overrides.global = {
      Environment = {
        XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";
        GTK_THEME = "Adwaita:dark";
      };
    };
  };
}
