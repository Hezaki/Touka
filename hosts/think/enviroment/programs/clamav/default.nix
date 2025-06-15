{
  services.clamav = {
    scanner.enable = true;
    updater = {
      enable = true;
      interval = "daily";
      frequency = 1;
      settings = {
        PrivateMirror = [
          "https://clamav-mirror.ru/"
          "https://mirror.truenetwork.ru/clamav/"
          "http://mirror.truenetwork.ru/clamav/"
        ];
        ScriptedUpdates = "no";
      };
    };
  };
}
