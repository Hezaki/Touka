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
    graalvm-ce

    nil
    lua-language-server
  ];
}
