{
  security = {
    sudo-rs.enable = true;
    polkit.enable = true;
  };

  services.fprintd.enable = false;
}
