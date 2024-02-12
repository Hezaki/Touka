{ pkgs, ... }: {
  home.packages = with pkgs; [
    gcc
    gnumake
    pkg-config
    glibc

    openjdk8-bootstrap

    nodejs

    python311Packages.ipython

    nginx

    libressl

    distrobox
    podman
    podman-compose 
  ];
}
