{ config, ... }:

with config.lib.stylix.colors.withHashtag;
{
  programs.obsidian.enable = true;
}
