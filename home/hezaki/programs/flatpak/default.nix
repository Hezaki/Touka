{ inputs, ...}: {
  imports = [
    inputs.flatpaks.homeManagerModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;
    update.onActivation = true;
    packages = [
      "net.blockbench.Blockbench"
      "io.github.tdesktop_x64.TDesktop"
    ];
    overrides = {
      global = {
        Context.sockets = ["wayland" "!fallback-x11"];
        Context.filesystem = "home";
      };
    };
  };
}
