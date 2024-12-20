{ pkgs, ... }:
{
  security = {
    sudo-rs = {
      enable = true;
      extraRules = [
        {
          groups = [ "wheel" ];
          commands = [
            {
              command = "${pkgs.light}/bin/light";
              options = [ "NOPASSWD" ];
            }
            # {
            #   command = "tee";
            #   options = [ "NOPASSWD" ];
            # }
          ];
        }
      ];
    };
  };
}
