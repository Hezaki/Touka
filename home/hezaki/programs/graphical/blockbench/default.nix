{ config, pkgs, ... }:{
  home.packages = with pkgs; [ blockbench ];
  xdg.configFile."blockbecnh/theme.bbtheme".text = ''
    {
      "name": "Hqzk",
      "author": "Penis",
      "borders": false,
      "main_font": "Sans Serif",
      "headline_font": "Sans Serif",
      "code_font": "",
	    "css": "/*\n     Crimson - Malik12tree\n*/\n\n/* Animations */\n@keyframes expand_font {\n  from { font-size: 0.5em }\n  to   { font-size: auto  }\n}\n/* Rules */\nbody {\n  font-weight: 400;\n  --color-menu_separator: var(--color-back);\n  --template-basic_filter: blur(2px) grayscale(0.5);\n  --crimson-border_radius: 3px;\n}\n#start_screen .recent_project.thumbnail {\n  box-shadow: 0 0 5px #000000aa;\n}\ndiv.start_screen_right > ul.recent_list_grid {\n  padding: 3px;\n  gap: 3px;\n}\n#page_wrapper {\n  background: linear-gradient(#${config.lib.stylix.colors.base00}, var(--color-dark), var(--color-dark));\n}\n.contextMenu {\n  background-color: #111113f1;\n  backdrop-filter: var(--template-basic_filter);\n  animation: expand_font 125ms ease;\n}\ndialog {\n  background-color: #151519ef;\n  backdrop-filter: var(--template-basic_filter);\n}\n\n.dialog_sidebar .dialog_sidebar_pages li {\n  padding: 6px 10px;\n}\n.dialog_handle {\n  font-size: 1.25em;\n  height: auto;\n}\n.dialog_close_button {\n  top: 3px;\n  right: 3px;\n  border-radius: 1px;\n  transition: 50ms ease;\n}\n.dialog_menu_button {\n  margin-top: 3px;\n  display: flex;\n  justify-content: center;\n}\n.tooltip {\n    padding-inline: 10px;\n}\n.tooltip_description { left: 2px }\n\n#start_files li.format_entry.selected {\n    background-color: var(--color-accent);\n    color: var(--color-text);\n}\n#start_files li.format_entry {\n    padding-block: 5px;\n}\n.tool.enabled {\n  color: var(--color-light);\n}\n#theme_list {\n    padding: 5px;\n}\n.theme {\n  box-shadow: 0 0 7px #000000ed;\n}\n.theme.selected {\n  box-shadow: 0 0 7px var(--color-accent);\n}\n.contextMenu li:is(.focused, .parent.opened),\n.plugin_tag_list li,\n#start_files li.format_entry.selected,\n.format_target span,\n.form_inline_select > li.selected,\n#start_screen .recent_project.thumbnail:hover,\n#action_selector ul > li.selected,\n.contextMenu li.hybrid_parent.opened\n{\n  /*\n    Using normal `font-weight` changes the text width. Instead,\n    .. we simulate a \"bold\" effect using `text-shadow`\n  */\n  /*font-weight: normal;*/\n  text-shadow: 0 0 0 var(--color-accent_text);\n  color: var(--color-accent_text);\n}\n.contextMenu li.hybrid_parent.opened {\n    color: var(--color-subtle_text);\n    \n}\n::selection {\n  background: #ff719077;\n}\n\nbutton, dialog, .dialog_handle,\n.contextMenu,\n.theme,\n#start_screen .recent_project.thumbnail,\nbb-select,\ninput:is([type=\"text\"], [type=\"number\"]),\ntextarea,\n.numeric_input > input,\n#quick_message_box,\n.tooltip,\n.theme.selected .theme_preview_menu\n{\n  border-radius: var(--crimson-border_radius);\n}\n.contextMenu li:first-child {\n  border-top-left-radius: var(--crimson-border_radius);\n  border-top-right-radius: var(--crimson-border_radius);\n}\n.contextMenu li:last-child {\n  border-bottom-left-radius: var(--crimson-border_radius);\n  border-bottom-right-radius: var(--crimson-border_radius);\n}\n\n/* Icon Themes */\n.tool.play_animation:hover {\n  color: #${config.lib.stylix.colors.base0B};\n}\n.toggle_shading i {\n  color: #${config.lib.stylix.colors.base09};\n}\n.toolbar .icon-gizmo {\n  background: conic-gradient(\n    var(--color-axis-y),\n    var(--color-axis-y),\n    var(--color-axis-y),\n    var(--color-axis-y),\n    var(--color-axis-x),\n    var(--color-axis-x),\n    var(--color-axis-x),\n    var(--color-axis-x),\n    var(--color-axis-z),\n    var(--color-axis-z),\n    var(--color-axis-z),\n    var(--color-axis-z)\n  );\n  background-size: 100% 100%;\n\n  -webkit-background-clip: text;\n  -webkit-text-fill-color: #ffffff33;\n}",
      "colors": {
        "ui": "#${config.lib.stylix.colors.base00}",
        "back": "#${config.lib.stylix.colors.base00}",
        "dark": "#${config.lib.stylix.colors.base00}",
        "border": "#${config.lib.stylix.colors.base02}",
        "selected": "#${config.lib.stylix.colors.base03}",
        "button": "#${config.lib.stylix.colors.base02}",
        "bright_ui": "#${config.lib.stylix.colors.base00}",
        "accent": "#${config.lib.stylix.colors.base0D}",
        "frame": "#${config.lib.stylix.colors.base00}",
        "text": "#${config.lib.stylix.colors.base06}",
        "light": "#${config.lib.stylix.colors.base07}",
        "accent_text": "#${config.lib.stylix.colors.base00}",
        "bright_ui_text": "#${config.lib.stylix.colors.base06}",
        "subtle_text": "#${config.lib.stylix.colors.base05}",
        "grid": "#${config.lib.stylix.colors.base0E}",
        "wireframe": "#${config.lib.stylix.colors.base0D}",
        "checkerboard": "#${config.lib.stylix.colors.base02}"
      }
    }
  '';
}
