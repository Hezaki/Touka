{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.pullImage {
  imageName = "alpine";
  imageDigest = "sha256:82389ea44e50c696aba18393b168a833929506f5b29b9d75eb817acceb6d54ba";
  finalImageTag = "latest";
  sha256 = "sha256-kqOws3lmYkjb/ZkBc31ILH41vHMNzANl3IJEpT9D7VY=";
  os = "linux";
  arch = "x86_64";
}
