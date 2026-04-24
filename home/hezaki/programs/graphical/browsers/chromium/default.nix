{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    # package = pkgs.ungoogled-chromium;
    extensions = [
      {
        id = "dbepggeogbaibhgnhhndojpepiihcmeb";
      } # Vimium
    ];
  };
}
