{ pkgs, ... }: {
  home.packages = with pkgs; [
    distrobox
    podman
    podman-compose 
  ];
}
