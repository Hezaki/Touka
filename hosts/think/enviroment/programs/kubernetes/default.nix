{
  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = "--disable-agent --write-kubeconfig-mode 644";
  };
}
