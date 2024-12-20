{ pkgs, inputs, ... }:
{
  home = {
    username = "samatovna";
    homeDirectory = "/home/samatovna";
    stateVersion = "23.11";
    packages = with pkgs; [
      fd
      duf
      mpv
      foot
      ncdu
      dconf
      firefox
      zathura
      ripgrep
      bottles
      htop-vim
      libreoffice
      home-manager
      telegram-desktop
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };

  nix = {
    package = pkgs.nix;
    settings = {
      builders-use-substitutes = true;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
  imports = [
    ./themes
    # ./programs/firefox
  ];
}
