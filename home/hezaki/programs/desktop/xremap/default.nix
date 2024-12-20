{ inputs, ... }:
{
  imports = [
    inputs.xremap.homeManagerModules.default
  ];

  services.xremap = {
    enable = true;
    withHypr = true;
    config = {
      keymap = [
        {
          name = "firefox";
          remap = {
            super-y = {
              launch = [ "firefox" ];
            };
          };
        }
      ];
    };
  };
}
