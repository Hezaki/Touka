{ pkgs, ... }: {
  home.packages = with pkgs; [
    # C
    gcc
    gnumake
    pkg-config
    glibc

    # Java
    openjdk8-bootstrap

    # JavaScript
    nodejs

    # Python
    python311 

    # Docker
    distrobox
    podman
    podman-compose 
  ];
}
