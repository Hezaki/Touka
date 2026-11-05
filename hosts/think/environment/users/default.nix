{ pkgs, config, ... }:
let
  user = "hezaki";
  passroot = "${config.sops.secrets."passroot".path}";
  passuser = "${config.sops.secrets."passuser".path}";
in
{
  users = {
    users = {
      ${user} = {
        isNormalUser = true;
        initialPassword = passuser;
        home = "/home/${user}";

        extraGroups = [
          "wheel"
          "user-with-access-to-virtualbox"
          "i2c"
        ];

        shell = pkgs.fish;
      };

      root = {
        initialPassword = passroot;
        shell = pkgs.fish;
      };
    };

    groups = {
      video.members = [ "hezaki" ];
      uinput.members = [ "hezaki" ];
      input.members = [ "hezaki" ];
    };
  };
}
