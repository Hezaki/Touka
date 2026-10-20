{
  pkgs,
  inputs,
  ...
}:

{
  imports = with inputs; [
    nix-index-database.nixosModules.nix-index
    ./nh
    ./kanata
    ./nix-ld
    ./clamav
    ./steam
    ./polkit
    ./podman
    ./flatpak
    ./gpu-screen-recorder
    ./proxy-suite
    ./dns-crypt
    ./throne
    ./apparmor
    ./scx
    ./sops
    ./bluevien
  ];

  environment.systemPackages = with pkgs; [
    nix-tree
    comma
    impala
    sbctl
    ddcutil
  ];

  systemd.services.disable-micmute-led = {
    description = "Disable ThinkPad microphone mute LED";
    wantedBy = [ "multi-user.target" ];
    after = [ "sound.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.bash}/bin/bash -c 'echo off > /sys/class/sound/ctl-led/mic/mode'";
    };
  };

  documentation = {
    enable = true;
    man.enable = true;
    doc.enable = false;
    dev.enable = false;
  };

  virtualisation = {
    oci-containers.backend = "podman";
    spiceUSBRedirection.enable = true;
  };

  services = {
    fwupd.enable = true;
    flatpak.enable = true;
    gvfs.enable = true;

    earlyoom = {
      enable = true;
      enableNotifications = true;
    };
  };

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-termfilechooser
    ];

    config = {
      common = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
      };
    };
  };

  programs = {
    fish.enable = true;
    dconf.enable = true;
    gamemode.enable = true;

    nix-index-database = {
      enable = true;
      comma.enable = true;
    };

    appimage = {
      enable = true;
      binfmt = true;
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
