{ inputs, withSystem, ... }:

{
  imports = [ inputs.home-manager.flakeModules.default ];

  flake.homeConfigurations.hezaki = withSystem "x86_64-linux" (
    { pkgs, ... }:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs; };
      modules = [
        ({ pkgs, inputs, ... }: {
          imports =  [
            ./programs
            ./themes
          ];

          home = {
            username = "hezaki";
            homeDirectory = "/home/hezaki";
            stateVersion = "26.05";

            packages =
              with pkgs;
              with inputs;
              [
                android-tools
                authenticator
                bleachbit
                bluetui
                bottles
                cpu-x
                dtrx
                dua
                duf
                element-desktop
                evtest
                gcr
                gdb
                gnome-decoder
                gnome-secrets
                gomi
                gradia
                jq
                kdePackages.kdenlive
                krita
                libnotify
                libreoffice
                losslesscut-bin
                lutgen
                microfetch
                mousai
                nautilus
                nix-init
                obsidian
                onefetch
                piper
                polkit_gnome
                ppsspp-sdl-wayland
                pywalfox-native
                ripdrag
                scrcpy
                swaybg
                swayimg
                teamspeak3
                tesseract
                varia
                via
                wiremix
                xwayland-satellite
                zenity
              ];
          };

          services.gnome-keyring.enable = true;
          programs.home-manager.enable = true;

          nix = {
            package = pkgs.nix;
            nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

            settings = {
              builders-use-substitutes = true;

              experimental-features = [
                "nix-command"
                "flakes"
              ];
            };
          };
        })
      ];
    }
  );
}
