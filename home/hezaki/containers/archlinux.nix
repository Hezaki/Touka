{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.buildImage {
  name = "archlinux";
  tag = "latest";
  created = "now";
  fromImage = pkgs.dockerTools.pullImage {
    imageName = "archlinux";
    imageDigest = "sha256:5af2b0f645075a73bcb19e8c0f24b6b0d86a4305e1a84f9a53f9fd5e7bc0f648";
    finalImageTag = "latest";
    sha256 = "sha256-w2G8S31cio6YB5x6EWdaLhLhAaVKi4YuRhsI2I7FPWs";
    os = "linux";
    arch = "x86_64";
  };

  # runAsRoot = ''
  #   #!${pkgs.runtimeShell}
  #   ${pkgs.dockerTools.shadowSetup}
  #   pacman -Syu git neofetch --noconfirm
  #   cd /etc
  #   git clone https://codeberg.org/hezaki/archd.git
  #   rm -rf .git
  # '';
}
