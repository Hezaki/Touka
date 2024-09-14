{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [ _64gram ];
    file = {
      ".local/share/64Gram/tdata/shortcuts-custom.json".text = ''
        [
          {
            "command": "show_archive",
            "keys": "ctrl+b"
          },
          {
            "command": "search",
            "keys": "ctrl+/"
          },
          {
            "command": "global_search",
            "keys": "ctrl+f"
          }
        ]
      '';
      ".local/share/64Gram/tdata/experimental_options.json".text = ''
        {
          "send-large-photos": true
          "ctrl-click-chat-new-window": true,
          "use-small-msg-bubble-radius": false
        }
      '';
      ".local/share/64Gram/tdata/enhanced-settings-custom.json".text = ''
        {
          "always_delete_for": 0,
          "auto_unmute": true,
          "bitrate": 0,
          "blocked_user_spoiler_mode": false,
          "disable_cloud_draft_sync": false,
          "disable_global_search": false,
          "disable_link_warning": false,
          "disable_premium_animation": false,
          "hd_video": false,
          "hide_all_chats": true,
          "hide_classic_fwd": true,
          "hide_counter": false,
          "hide_stories": true,
          "net_dl_speed_boost": true,
          "net_speed_boost": 3,
          "radio_controller": "http://localhost:2468",
          "repeater_reply_to_orig_msg": true,
          "replace_edit_button": true,
          "show_emoji_button_as_text": true,
          "show_group_sender_avatar": true,
          "show_messages_id": false,
          "show_phone_number": false,
          "show_repeater_option": true,
          "show_scheduled_button": true,
          "show_seconds": false,
          "skip_to_next": false,
          "stereo_mode": false,
          "translate_to_tc": false
        }
      '';
    };
  };
}
