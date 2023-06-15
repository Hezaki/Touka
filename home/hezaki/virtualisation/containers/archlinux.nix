{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.pullImage {
  imageName = "archlinux";
  imageDigest = "sha256:5af2b0f645075a73bcb19e8c0f24b6b0d86a4305e1a84f9a53f9fd5e7bc0f648";
  finalImageTag = "latest";
  sha256 = "sha256-w2G8S31cio6YB5x6EWdaLhLhAaVKi4YuRhsI2I7FPWs";
  os = "linux";
  arch = "x86_64";
}
