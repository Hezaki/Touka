{ config, ... }:
{
  home = {
    file."Documents/Notes/.obs.desktop/themes/Stylix/manifest.json".text = # json
      ''
        {
           "name": "Stylix",
           "version": "1.1.1",
           "minAppVersion": "1.1.1",
           "author": "Hezaki",
           "authorUrl": "https://github.com/hezaki"
        }
      '';
    file."Documents/Notes/.obs.desktop/themes/Stylix/theme.css".text =
      with config.lib.stylix.colors; # css
      ''
            :root {
              font-family: Inter, serif !important;
            }
            .theme-dark,
            .theme-light{
              /* Actual colors*/
              --background-primary: #${base00};
              --background-primary-alt: #${base02};
              --background-secondary: #${base00};
              --background-secondary-alt: #${base00};
              --text-normal: #${base05};
              --text-on-accent: #${base02};
              --text-title-h1: #${base0E};
              --text-title-h2: #${base08};
              --text-title-h3: #${base09};
              --text-title-h4: #${base0B};
              --text-title-h5: #${base0C};
              --text-title-h6: #${base0D};
              --text-link: var(--text-accent);
              --markup-code: #${base09};
              --text-tag: #${base0E};
              --text-a: #${base0E};
              --text-a-hover: #${base0E};
              --text-mark: #${base0A};
              --interactive-accent: #${base0E};
              --blockquote-border: #${base0E};
              --interactive-accent-rgb: #${base0A};
              --accent-h: 255;
              --accent-s: 94%;
              --accent-l: 65%;

              /* Code view */
              --code-normal: #${base05};
              --code-background: #${base01};
              --dracula-foreground: #${base05};
              --dracula-Comment: #${base03};
              --dracula-keyword: #${base0E};
              --dracula-definition: #${base0B};
              --dracula-variable: #${base05}; /*"variable" tags are used everywhere in code, but Dracula usually only uses orange color only for declaration inputs, thus white is less annoying to look at*/
              --dracula-number: #${base0E};
              --dracula-function: #${base0D};
              --dracula-string: #${base09};
            }

            /* LINKS & BRACKETS */

            /* link */

            /* url's */

            /* editor */

            .cm-url {
              color: var(--text-link) !important;
            }

            /* preview */

            .external-link {
              color: var(--text-link) !important;
            }


            /* make external links italics to differentiate */

            a:not(.internal-link) {
              font-style: italic;
            }

            /* horizontal line in preview */

            hr {
              background-color: var(--text-normal);
              border-color: var(--text-normal);
            }

            .markdown-preview-view hr {
              background-color: var(--text-normal);
              border-color: var(--text-normal);
            }

            .markdown-rendered hr {
              background-color: var(--text-normal);
              border-color: var(--text-normal);
            }

            .markdown-embed {
              padding-left: 8px !important;
              padding-right: 4px !important;
              margin-left: 8px !important;
              margin-right: 4px !important;
            }

            /* internal embedded link rendering in preview */

            .markdown-embed-title {
              color: var(--text-link);
            }


            /* NAKED EMBEDS*/

            /* But keeping Border and Scroll! */

            .markdown-embed-title {
              display: none;
            }

            .markdown-preview-view .markdown-embed-content > :first-child {
              margin-top: 0;
            }

            .markdown-preview-view .markdown-embed-content > :last-child {
              margin-bottom: 0;
            }


            .markdown-embed-link {
              color: var(--text-a) !important;
              right: 2px !important;
            }

            .markdown-embed-link:hover {
              color: var(--text-link) !important;
            }

            /* NO FILE OPEN PAGE*/

            .empty-state-title {
              color: var(--text-title-h1) !important;
            }

            .empty-state-action {
              color: var(--text-muted) !important;
            }

            .empty-state-action:hover {
              color: var(--text-normal) !important;
            }

            /* GRAPH VIEW */

        #graph-view-canvas .links {
              stroke: var(--interactive-accent-rgb) !important;
            }

            /* CODEBLOCKS */


            /* code blocks in preview */

            pre code {
              padding: 5px !important;
              color: var(--dracula-foreground);
              line-height: normal;
              display: block;
              background-color: var(--background-primary);
            }

            .markdown-preview-view pre {
              padding: 0px !important;
            }

            /* in-line code for editor and preview and code block for editor*/

            .cm-inline-code {
              background-color: var(--background-primary-alt) !important;
              color: var(--dracula-foreground) !important;
              bottom: 0px !important;
            }

            /* Code Appearance */

            /* Editing view */

            .CodeMirror-code span.cm-inline-code {
              color: var(--markup-code) !important;
            }

            .cm-hmd-codeblock {
              color: var(--dracula-foreground);
            }

            .cm-hmd-codeblock.cm-keyword {
              color: var(--dracula-keyword);
            }

            .cm-def.cm-hmd-codeblock {
              color: var(--dracula-definition);
            }

            .cm-hmd-codeblock.cm-variable {
              color: var(--dracula-variable);
            }

            .cm-hmd-codeblock.cm-operator{
              color: var(--dracula-keyword);
            }

            .cm-hmd-codeblock.cm-number {
              color: var(--dracula-number);
            }

            .cm-builtin.cm-hmd-codeblock {
              color: var(--dracula-function);
            }

            .cm-hmd-codeblock.cm-string {
              color: var(--dracula-string);
            }

            /* Preview */

            code {
              background-color: var(--background-primary);
              color: var(--dracula-foreground);
            }

            .token.function {
              color: var(--dracula-definition);
            }

            .token.operator {
              color: var(--dracula-keyword);
            }

            .token.number {
              color: var(--dracula-number);
            }

            .token.builtin {
              color: var(--dracula-function);
            }

            .token.boolean {
              color: var(--dracula-number);
            }

            .token.string {
              color: var(--dracula-string);
            }

            /* Editor CodeBlock TEXT Appearance - */

            .cm-s-obsidian pre.HyperMD-codeblock {
              color: var(--markup-code) !important;
            }

            /* borders */

            .cm-s-obsidian span.cm-inline-code {
              border: 1px solid #${base00};
              border-radius: 4px;
            }

            .cm-s-obsidian span.cm-formatting-code.cm-inline-code {
              border-right-width: 0;
              border-top-right-radius: 0;
              border-bottom-right-radius: 0;
            }

            .cm-s-obsidian span.cm-formatting-code.cm-inline-code + span.cm-inline-code {
              border-right: none;
              border-left: none;
              border-radius: 0;
            }

            .cm-s-obsidian
              span.cm-formatting-code.cm-inline-code
              + span.cm-inline-code
              + span.cm-formatting-code.cm-inline-code {
              border-left-width: 0;
              border-top-left-radius: 0;
              border-bottom-left-radius: 0;
              border-right-width: 1px;
              border-top-right-radius: 4px;
              border-bottom-right-radius: 4px;
            }

            /* BLOCKQUOTES */

            /* editor */

            .cm-quote {
              color: var(--interactive-accent) !important;
              font-style: italic;
            }

            /* preview */

            blockquote {
              color: var(--interactive-accent) !important;
              font-style: italic;
              border-color: var(--blockquote-border) !important;
            }

            /* IMAGES */

            /* embedded images */

            img {
              display: block;
              margin-left: 20pt;
              margin-right: auto;
            }

            /* TABLES */

            th {
              border: 1px solid var(--background-primary-alt) !important;
            }

            td {
              border: 1px solid var(--background-primary-alt) !important
            }

            thead {
              border-bottom: 4px solid var(--background-primary-alt);
            }

            .table {
              background-color: var(--background-secondary-alt);
              border: 1px solid var(--background-primary-alt);
              padding: 4px;
              line-height: normal;
              display: block;
              border-top-left-radius: 4px;
              border-top-right-radius: 4px;
              border-bottom-right-radius: 4px;
              border-bottom-left-radius: 4px;
            }

            /* SIDEBAR & DOCK ETC. */

            /* view action buttons */

            .view-action {
              color: var(--text-muted) !important;
              text-decoration: none !important;
            }

            .view-action:hover,
            .view-action.is-active {
              color: var(--text-normal) !important;
            }

            .status-bar {
              background-color: var(--background-secondary-alt);
            }

            .side-dock-ribbon-action {
              color: var(--text-muted) !important;
            }

            .side-dock-ribbon-action:hover {
              color: var(--text-normal) !important;
            }

            .workspace-tab-header {
              color: var(--text-muted) !important;
              text-decoration: none !important;
            }

            .workspace-tab-header:hover {
              color: var(--text-normal) !important;
            }

            button.mod-cta {
                background-color: var(--interactive-accent);
                color: var(--text-on-accent);
            }

            .horizontal-tab-nav-item.is-active, .vertical-tab-nav-item.is-active {
              background-color: var(--interactive-accent);
              color: var(--text-on-accent);
            }

            /* searchbar */

            .side-dock-panels-container {
              background-color: var(--background-secondary-alt) !important;
              color: var(background-secondary-alt);
            }

            /* icons at top of panes*/

            .file-view-actions a {
              color: var(--text-muted) !important;
            }

            .file-view-actions a:hover {
              color: var(--text-muted) !important;
            }

            /* html tags in editor */

            .cm-tag {
              color: var(--text-tag) !important;
            }

            /* .side-dock-ribbon-tab,
            .side-dock-ribbon-action {} */

            .side-dock-ribbon-tab.is-active {
              color: var(--interactive-accent) !important;
            }

            .side-dock-ribbon-tab.is-active .side-dock-ribbon-tab-inner:hover {
              color: #${base0E} !important;
              background-color: var(--background-secondary);
            }

            .nav-file-title {
              color: var(--text-muted) !important;
              background-color: var(--background-secondary);
            }

            .is-translucent .nav-file-title:not(.is-active) {
              background-color: transparent;
            }

            .nav-folder-title {
              color: var(--text-muted) !important;
              background-color: var(--background-secondary);
            }

            .is-translucent .nav-folder-title {
              background-color: transparent;
            }

            .nav-file-title:hover {
              color: var(--text-normal) !important;
            }

            .nav-folder-title:hover {
              color: var(--text-normal) !important;
            }

            .nav-action-button.is-active {
              background-color: var(--background-secondary-alt);
            }

            .search-result-file-title {
              color: var(--text-a) !important;
              background-color: var(--background-secondary);
            }

            .is-translucent .search-result-file-title {
              background-color: transparent;
            }

            .search-result-file-matched-text {
              color: var(--text-link) !important;
              background-color: var(--background-secondary);
            }

            /* .nav-file-tag {
              color: #${base0C};
              } /* for the PNG text, but can't specifically target "PNG", just all of those filetype tags. */

            .nav-file.is-active .nav-file-tag {
              color: var(--text-normal);
            }

            /* hover actions on side dock navigation */

            .side-dock-ribbon-tab:hover,
            .side-dock-ribbon-tab-inner:hover,
            .side-dock-ribbon-action:hover,
            .side-dock-ribbon-action.is-active:hover,
            .nav-action-button:hover,
            .side-dock-collapse-btn:hover {
              color: var(--text-normal);
            }

            /* Hover color over tree item flairs */
            .tree-item-self:hover .tree-item-flair {
              background-color: var(--background-secondary);
            }

            /* clean up side bar empty state (e.g. unlinked mentions) */

            .search-empty-state {
              width: auto;
              padding-left: 15px;
              padding-right: 15px;
              line-height: normal;
            }

            /* clean up side bar empty state (e.g. unlinked mentions) */

            .search-empty-state {
              width: auto;
              padding-left: 10px;
              padding-right: 5px;
              line-height: normal;
            }

            /* NORMAL TEXT OUTSIDE OF HEADINGS AND CODE */

            /* preview */

            .markdown-preview-view {
              color: var(--text-normal);
              padding-left: 8% !important;
              padding-right: 4% !important;
            }

            .mod-single-child .markdown-preview-view {
              color: var(--text-normal);
              padding-left: 10% !important;
              padding-right: 10% !important;
            }

            /* editor */

            .cm-s-obsidian {
              color: var(--text-normal);
              padding-left: 8% !important;
              padding-right: 4% !important;
            }

            .mod-single-child .cm-s-obsidian {
              color: var(--text-normal);
              padding-left: 8% !important;
              padding-right: 4% !important;
            }

            /* HEADINGS */

            /* preview */

            .markdown-preview-view h1 {
              color: var(--text-title-h1);
            }

            .markdown-preview-view h2 {
              color: var(--text-title-h2);
            }

            .markdown-preview-view h3 {
              color: var(--text-title-h3);
            }

            .markdown-preview-view h4 {
              color: var(--text-title-h4);
            }

            .markdown-preview-view h5 {
              color: var(--text-title-h5);
            }

            .markdown-preview-view h6 {
              color: var(--text-title-h6);
            }

            /* editor */

            .cm-header-1 {
              color: var(--text-title-h1);
            }

            .cm-header-2 {
              color: var(--text-title-h2);
            }

            .cm-header-3 {
              color: var(--text-title-h3);
            }

            .cm-header-4 {
              color: var(--text-title-h4);
            }

            .cm-header-5 {
              color: var(--text-title-h5);
            }

            .cm-header-6 {
              color: var(--text-title-h6);
            }

            /* TAGS */

            /* preview */

            a.tag {
              color: var(--text-tag);
            }

            /* editor */

            .cm-hashtag {
              color: var(--text-tag) !important;
            }

            /* BOLD */

            /* preview */

            strong {
              color: var(--markup-code);
            }

            /* editor */

            .cm-strong {
              color: var(--markup-code);
            }

            /* ITALICS */

            /* preview */

            em {
              color: var(--interactive-accent);
            }

            /* editor */

            .cm-em {
              color: var(--interactive-accent);
            }

            /* HIGHLIGHT */

            /* preview */

            mark {
              color: var(--background-primary);
              background-color: var(--text-mark);
              padding-top: 1px;
              padding-bottom: 1px;
            }

            /* editor */

            .cm-highlight {
              color: var(--background-primary) !important;
              background-color: var(--text-mark) !important;
              padding-top: 1px;
              padding-bottom: 1px;
            }

            /* COLLAPSED RIBBONS */

            .workspace-ribbon.is-collapsed {
              background-color: var(--background-secondary-alt) !important;
            }

            .workspace-ribbon.mod-right.is-collapsed {
              background-color: var(--background-secondary-alt) !important;
            }

            .workspace-ribbon.mod-left.is-collapsed {
              background-color: var(--background-secondary-alt) !important;
            }

            /* POPUP NOTIFICATION*/

            .notice {
              color: var(--text-normal) !important;
              background-color: var(--blockquote-border) !important;
            }

            /* UL, OL, BULLETS, CHECKBOXES & FOLDING ARROWS */

            /* task lists */

            .markdown-preview-view .task-list-item-checkbox {
              -webkit-appearance: none;
              top: 1.3px !important;
              right: 5px !important;
              box-sizing: border-box;
              border: 1px solid var(--accent-2);
              position: relative;
              width: 1.25em;
              height: 1.25em;
              margin: 0;
              box-shadow: 0 0 0.1em var(--interactive-accent);
            }

            .markdown-preview-view .task-list-item-checkbox:checked::before {
              content: "✓";
              position: absolute;
              color: var(--interactive-accent);
              line-height: 1.25em;
              width: 1.2em;
              text-align: center;
              text-shadow: 0 0 0.5em var(--accent-2);
            }

            .markdown-preview-view .task-list-item-checkbox {
              top: 0px;
            }

            .checkbox-container {
              background-color: var(--background-primary-alt);
              border-radius: 14px;
              display: inline-block;
              height: 22px;
              position: relative;
              top: 4px;
              user-select: none;
              width: 42px;
              box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.15);
              transition: background 0.15s ease-in-out, box-shadow 0.15s ease-in-out,
                border 0.15s ease-in-out, opacity 0.15s ease-in-out,
                -webkit-box-shadow 0.15s ease-in-out;
            }

            .checkbox-container.is-enabled {
              background-color: var(--interactive-accent);
            }


            .markdown-preview-view mark {
              color: var(--text-link);
              background-color: var(--background-primary-alt);
            }

            .cm-formatting
            /* This is the color of header hashtags. Don't change. */

            .cm-formatting-list-ul .cm-list-1
            /* This is the color of text in lists. Don't change. */


            /* Subtler code folding arrows */

            .CodeMirror-foldgutter-folded:after,
            .CodeMirror-foldgutter-open:after {
              opacity: 0.5;
              color: var(--text-link);
            }

            .CodeMirror-foldgutter-folded:hover:after,
            .CodeMirror-foldgutter-open:hover:after {
              opacity: 1;
              color: var(--text-link);
            }

            .CodeMirror-foldgutter-folded:after {
              content: "\25BA";
              color: var(--text-link);
            }

            .CodeMirror-foldgutter-open:after {
              content: "\25BC";
            }

            /* Bullet Point Relationship Lines */

            .cm-hmd-list-indent .cm-tab,
            ul ul {
              position: relative;
            }

            .cm-hmd-list-indent .cm-tab::before,
            ul ul::before {
              content: "";
              border-left: 1px solid;
              color: #${base03};
              position: absolute;
            }

            .cm-hmd-list-indent .cm-tab::before {
              left: 0;
              top: -5px;
              bottom: -4px;
            }

            ul ul::before {
              left: 0px;
              top: 0;
              bottom: 0;
            }

            /* ul, li & ol colors in editor */

            .cm-s-obsidian span.cm-formatting-list {
              color: #${base03};
            }

            ol {
              display: block;
              list-style-type: decimal;
              margin-block-start: 1em;
              margin-block-end: 1em;
              margin-inline-start: 0px;
              margin-inline-end: 0px;
              padding-inline-start: 40px;
            }

            .suggestion-highlight {
              color: var(--interactive-accent)!important;
            }

            .is-selected {
              background-color: var(--blockquote-border)!important;
            }

            /* PDF */
            @media print { 
              @page {
                margin: 0 !important;
                padding: 0 !important;
              }

              .print .markdown-preview-view {
                  -webkit-print-color-adjust: exact;
                  background-color: #${base00};
                  color: #${base05};
              }
              .markdown-rendered code {
                  color: #${base05} !important;
              }
            }
      '';
  };
}
