{ inputs, ... }:

{
  imports = [
    inputs.helium-browser.homeModules.default
  ];

  programs.helium = {
    enable = true;

    flags = [
      "--ozone-platform-hint=auto"
      "--enable-features=TouchpadOverscrollHistoryNavigation"
    ];

    policies = {
      "BrowserSignin" = 0;
      "PasswordManagerEnabled" = false;
      "SyncDisabled" = true;
      "SpellcheckEnabled" = true;
      "DefaultSearchProviderEnabled" = true;
      "DefaultSearchProviderSearchURL" = "https://search.brave.com/?q={searchTerms}";

      "SpellcheckLanguage" = [
        "en-US"
        "ru-Ru"
      ];

      "ExtensionInstallForcelist" = [ ];
    };
  };
}
