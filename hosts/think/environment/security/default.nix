{
  security = {
    sudo-rs.enable = true;
    polkit.enable = true;
    tpm2.enable = true;
  };

  services.fprintd.enable = false;
}
