{ pkgsUnstable, ... }:

{
  programs.yt-dlp = {
    enable = true;
    package = pkgsUnstable.yt-dlp;
  };
}
