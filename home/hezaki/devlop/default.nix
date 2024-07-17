{ pkgs, ... }: {
  home.packages = with pkgs; [
    gcc
    gnumake
    pkg-config
    glibc
    python311Packages.ipython
    # nginx
    distrobox
    cargo

    nil
    lua-language-server
  ];
}
