{
  security.pam = {
    enableFscrypt = true;
    services.login.fprintAuth = true;
  };
}
