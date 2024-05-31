{
  services.espanso = {
    enable = true;
    configs = {
      default = {
        show_notifications = false;
      };
      vscode = {
        filter_title = "Visual Studio Code$";
        backend = "Clipboard";
      };
    };
  };
}
