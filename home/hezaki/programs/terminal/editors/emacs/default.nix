{ pkgs, config, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    extraPackages = epkgs: with epkgs; [
      evil
      smartparens
      org
      org-bullets
      org-modern
      org-roam
      org-roam-ui
    ];
    extraConfig = ''
      ;; Font
      (set-frame-font "JetBrainsMono NF 13" nil t)
      (setq default-frame-alist '((font . "JetBrainsMono NF 13")))
      (setq global-prettify-symbols-mode t)

      ;; Custom colors
      (custom-set-faces
        `(org-block-begin-line ((t (:background ,"#${config.lib.stylix.colors.base00}"))))
        `(org-block-end-line ((t (:background ,"#${config.lib.stylix.colors.base00}"))))
        `(mode-line ((t (:background ,"#${config.lib.stylix.colors.base00}"))))
        `(line-number ((t (:background ,"#${config.lib.stylix.colors.base00}")))))

      ;; Scrolling as in my neovim configuration
      (setq 
        scroll-step 1
        scroll-margin 5
        scroll-conservatively 10000
        next-screen-context-lines 5
        line-move-visual nil)
      
      ;; Evil
      (evil-mode t)

      ;; Autopair
      (smartparens-global-mode t)

      ;; Org-mode
      (setq 
        org-auto-align-tags nil
        org-edit-src-content-indentation 0
        org-tags-column 0
        org-auto-align-tags nil
        org-catch-invisible-edits 'show-and-error
        org-special-ctrl-a/e t
        org-insert-heading-respect-content t
        org-hide-emphasis-markers t
        org-pretty-entities t
        org-startup-indented t
        org-ellipsis " ▾"
        org-hide-emphasis-markers t
        org-pretty-entities t
        org-src-fontify-natively t
        org-fontify-whole-heading-line t
        org-fontify-quote-and-verse-blocks t
        org-edit-src-content-indentation 2
        org-hide-block-startup nil
        org-src-tab-acts-natively t
        org-src-preserve-indentation nil
        org-startup-folded t
        org-cycle-separator-lines 2
        org-hide-leading-stars t
        org-highlight-latex-and-related '(native)
        org-goto-auto-isearch nil)

      (custom-set-faces
        '(org-level-1 ((t (:inherit outline-1 :height 1.180))))
        '(org-level-2 ((t (:inherit outline-2 :height 1.140))))
        '(org-level-3 ((t (:inherit outline-3 :height 1.120))))
        '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
        '(org-level-5 ((t (:inherit outline-5 :height 1.080))))
        '(org-level-6 ((t (:inherit outline-5 :height 1.040))))
        '(org-level-6 ((t (:inherit outline-5 :height 1.020)))))

      (add-hook 'org-mode-hook #'org-bullets-mode)
      (add-hook 'org-mode-hook #'org-modern-mode)

      ;; Variables
      (custom-set-variables
        '(global-display-line-numbers-mode t)
        '(global-visual-line-mode t)
        '(global-tree-sitter-mode t)
        '(menu-bar-mode nil)
        '(tab-bar-new-button-show nil)
        '(tab-bar-close-button-show nil)
        '(tab-line-separator "")
        '(scroll-bar-mode nil)
        '(tab-bar-mode nil)
        '(tool-bar-mode nil)
        '(recentf-mode t)
        '(global-hl-line-mode t)
        '(pixel-scroll-precision-mode t))
        '(highlight-indent-guides-method 'character)
    '';

    #
    #   (custom-set-faces
    #     `(org-block-begin-line ((t (:background ,"#${config.lib.stylix.colors.base00}"))))
    #     `(org-block-end-line ((t (:background ,"#${config.lib.stylix.colors.base00}"))))
    #     `(mode-line ((t (:background ,"#${config.lib.stylix.colors.base00}"))))
    #     `(line-number ((t (:background ,"#${config.lib.stylix.colors.base00}")))))
    #
    #   (custom-set-variables
    #     '(global-display-line-numbers-mode t)
    #     '(global-visual-line-mode t)
    #     '(global-tree-sitter-mode t)
    #     '(menu-bar-mode nil)
    #     '(tab-bar-new-button-show nil)
    #     '(tab-bar-close-button-show nil)
    #     '(tab-line-separator "")
    #     '(scroll-bar-mode nil)
    #     '(tab-bar-mode nil)
    #     '(tool-bar-mode nil)
    #     '(recentf-mode t)
    #     '(global-hl-line-mode t)
    #     '(pixel-scroll-precision-mode t))
    #     '(highlight-indent-guides-method 'character)
    #
    #   (add-hook 'dired-mode-hook #'all-the-icons-dired-mode)
    #
    #   (smartparens-global-mode t)
    #
    #   (setq scroll-step 1
    #         scroll-margin 5
    #         scroll-conservatively 10000
    #         next-screen-context-lines 5
    #         line-move-visual nil)
    #
    #   (set-fringe-mode 0)
    #   (savehist-mode t)
    #   (save-place-mode t)
    #   (global-auto-revert-mode t)
    #   (set-window-margins (selected-window) 0 0)
    #   (set-frame-parameter nil 'internal-border-width 0)
    #   (setq inhibit-startup-screen t
    #         column-number-mode t
    #         indent-tabs-mode nil
    #         e-short-answers t
    #         blink-cursor-mode nil
    #         inhibit-compacting-font-caches t
    #         auto-save-interval 1000
    #         package-enable-at-startup nil
    #         pixel-resolution-fine-flag t
    #         select-enable-clipboard t
    #         indent-line-function 'insert-tab
    #         line-spacing 0
    #         make-backup-files nil)
    #
    #   (evil-mode t)
    #   (setq evil-search-module 'evil-search
    #         evil-want-integration t
    #         evil-want-keybinding nil)
    #
    #   ;; (evil-collection-init)
    #
    #   (global-anzu-mode t)
    #
    #   (electric-indent-mode nil)
    #   (setq org-auto-align-tags nil
    #       org-edit-src-content-indentation 0
    #       org-tags-column 0
    #       org-auto-align-tags nil
    #       org-catch-invisible-edits 'show-and-error
    #       org-special-ctrl-a/e t
    #       org-insert-heading-respect-content t
    #       org-hide-emphasis-markers t
    #       org-pretty-entities t
    #       org-startup-indented t
    #         org-ellipsis " ▾"
    #         org-hide-emphasis-markers t
    #         org-pretty-entities t
    #         org-src-fontify-natively t
    #         org-fontify-whole-heading-line t
    #         org-fontify-quote-and-verse-blocks t
    #         org-edit-src-content-indentation 2
    #         org-hide-block-startup nil
    #         org-src-tab-acts-natively t
    #         org-src-preserve-indentation nil
    #         org-startup-folded t
    #         org-cycle-separator-lines 2
    #         org-hide-leading-stars t
    #         org-highlight-latex-and-related '(native)
    #         org-goto-auto-isearch nil)
    #
    #   (add-hook 'org-mode-hook #'org-bullets-mode)
    #
    #   (defun org-visual-mode ()
    #     (olivetti-mode)
    #     (setq-local display-line-numbers-type nil))
    #   (add-hook 'org-mode-hook 'org-visual-mode)
    #
    #   (add-hook 'org-mode-hook 'evil-org-mode)
    #
    #   (add-hook 'org-mode-hook 'toc-org-mode)
    #
    #   (custom-set-faces
    #    '(org-level-1 ((t (:inherit outline-1 :height 1.180))))
    #    '(org-level-2 ((t (:inherit outline-2 :height 1.140))))
    #    '(org-level-3 ((t (:inherit outline-3 :height 1.120))))
    #    '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
    #    '(org-level-5 ((t (:inherit outline-5 :height 1.080))))
    #    '(org-level-6 ((t (:inherit outline-5 :height 1.040))))
    #    '(org-level-6 ((t (:inherit outline-5 :height 1.020)))))
    #
    #   (setq org-src-preserve-indentation t)
    #
    #   (add-hook 'org-mode-hook #'valign-mode)
    #
    #   (setq python-shell-interpreter "ipython"
    #         python-shell-interpreter-args "-i")
    #
    #   (defun affe-find-/ ()
    #    (interactive)
    #    (affe-find "."))
    #
    #   (defun affe-grep-/ ()
    #    (interactive)
    #    (affe-grep "."))
    #
    #   (defun vtermus ()
    #    (kill-buffer "*scratch*")
    #    (setq-local display-line-numbers-type nil)
    #    (hl-line-mode nil))
    #   (add-hook 'vterm-mode-hook #'vtermus)
    #
    #   (general-define-key
    #     :states '(normal visual)
    #     "C-=" 'text-scale-increase
    #     "C--" 'text-scale-decrease
    #     "M-\\" 'evil-window-vsplit
    #     "M--" 'evil-window-split
    #     "gc" 'comment-line
    #     "ff" 'affe-find-/
    #     "fg" 'affe-grep-/
    #     "fd" 'zoxide-find-file
    #     "<TAB>" 'evil-switch-to-windows-last-buffer
    #     "<S-TAB>" 'display-buffe)
    #
    #   (global-corfu-mode t)
    #   (corfu-history-mode t)
    #   (corfu-popupinfo-mode t)
    #   (setq corfu-auto t
    #       corfu-cycle t
    #         corfu-auto-delay 0
    #         corfu-auto-prefix 1 
    #         tab-always-indent 'complete)
    #
    #   (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)
    #
    #   (add-hook 'prog-mode-hook 'eglot-ensure)
    #
    #   (global-tree-sitter-mode)
    #   (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
    #
    #   (add-hook 'prog-mode-hook #'rainbow-mode)
    #
    #   (beacon-mode t)
    #
    #   (setq inferior-lisp-program "sbcl")
    #
    #   (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
    #
    #   (vertico-mode t)
    #   (vertico-reverse-mode t)
    #
    #   (setq completion-styles '(orderless)
    #         completion-category-overrides '((file (styles basic partial-completion)))
    #         orderless-skip-highlighting (lambda () selectrum-is-active)
    #       selectrum-highlight-candidates-function #'orderless-highlight-matches)
    #
    #   (doom-modeline-mode 1)
    #   (setq doom-modeline-icon t
    #       doom-modeline-bar-width 0
    #       doom-modeline-buffer-state-icon t
    #       doom-modeline-major-mode-color-icon t
    #       doom-modeline-persp-name t
    #         doom-modeline-persp-icon t)
    #
    #   (marginalia-mode t)
    #
    #   (add-hook 'sgml-mode-hook 'emmet-mode)
    #   (add-hook 'css-mode-hook  'emmet-mode)
    #
    #   (apheleia-global-mode t)
    #
    #   (add-hook 'olivetti-mode-on-hook (lambda () (olivetti-set-width 100)))
    #
    #   (gcmh-mode t)
    #   (setq gc-cons-threshold 402653184
    #       gc-cons-percentage 0.4)
    #   (add-hook 'emacs-startup-hook
    #     (lambda ()
    #     (message "*** Emacs loaded in %s with %d garbage collections."
    #     (format "%.2f seconds"
    #     (float-time
    #     (time-subtract after-init-time before-init-time)))
    #     gcs-done)))
    # '';
  };
}
