{ pkgs, ... }:{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    extraPackages = epkgs: with epkgs; [
      doom-themes
      all-the-icons
      nerd-icons
      dashboard

      evil
      evil-collection
      company
      company-box
      rainbow-mode
      vertico
      emojify-logos
      hl-todo
      vterm
      vterm-toggle
      lspce
      lsp-ui
      lsp-mode
      pdf-tools
      zoxide
      flycheck
      sideline-flycheck
      general
      nixos-options
      auto-complete

      org
      toc-org
      org-bullets
			nix-mode
    ];
    extraConfig = ''
       (set-frame-font "JetBrainsMono NF 13" nil t)
       (setq doom-themes-enable-bold t
             doom-themes-enable-italic t)
       (load-theme 'doom-gruvbox :no-confirm)
       (doom-themes-visual-bell-config)

       (custom-set-faces
             `(tab-bar ((t (:background ,(doom-color 'base02)))))
             `(mode-line ((t (:background ,(doom-color 'base02))))))

       (custom-set-variables
             '(global-display-line-numbers-mode t)
             '(global-visual-line-mode t)
             '(global-tree-sitter-mode t)
             '(menu-bar-mode nil)
             '(tab-bar-new-button-show nil)
             '(tab-bar-close-button-show nil)
             '(tab-line-separator "")
             '(scroll-bar-mode nil)
             '(tab-bar-mode t)
             '(tool-bar-mode nil)
             '(recentf-mode t)
             '(global-hl-line-mode t)
             '(pixel-scroll-precision-mode t))

       (global-set-key (kbd "C-=") 'text-scale-increase)
       (global-set-key (kbd "C--") 'text-scale-decrease)

       (setq redisplay-dont-pause t
       	     scroll-margin 5
             scroll-step 1
             scroll-conservatively 10000
             scrool-preserve-screen-position 1)

       (set-window-margins (selected-window) 0 0)
       (set-frame-parameter nil 'internal-border-width 0)
       (setq-default tab-width 2)
       (setq standard-indent 2
             package-enable-at-startup nil
             pixel-resolution-fine-flag t
             select-enable-clipboard t
             indent-line-function 'insert-tab
             line-spacing 0
             inhibit-startup-screen nil
             make-backup-files nil
             evil-want-keybinding nil
             evil-undo-system 'undo-redo
             evil-vsplit-window-right t
             evil-split-window-below t)

       (evil-mode t)
       (evil-collection-init)

       (global-company-mode t)
       (global-flycheck-mode t)

       (dashboard-setup-startup-hook)
    '';
  };
}
