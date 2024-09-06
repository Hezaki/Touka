{
  security = {
    doas = {
      enable = true;
      extraConfig = ''
        permit persist keepenv :wheel
        permit nopass hezaki as root cmd light
        permit nopass hezaki as root cmd tee
      '';
    };
    sudo.enable = true;
  };
}
