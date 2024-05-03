(set-frame-font "JetBrainsMono NF 13" nil t)
(setq global-prettify-symbols-mode t)
(setq doom-themes-enable-bold t
	  	doom-themes-enable-italic t
			nerd-icons-font-family "JetBrainsMono NF")
(load-theme 'doom-gruvbox :no-confirm)
(doom-themes-visual-bell-config)

(custom-set-faces
  `(tab-bar ((t (:background ,(doom-color 'base02)))))
	`(tab-line ((t (:background ,(doom-color 'base02)))))
	`(org-block ((t (:background ,(doom-color 'base02)))))
	`(centaur-tabs-default ((t (:background ,(doom-color 'base02)))))
	`(centaur-tabs-unselected ((t (:background ,(doom-color 'base02)))))
	`(mode-line ((t (:background ,(doom-color 'base02)))))
	`(doom-modeline-panel ((t (:background ,(doom-color 'base02))))))

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

(global-ligature-mode t)

(electric-indent-mode nil)
(setq org-auto-align-tags nil
			;; org-edit-src-content-indentation 0
			org-tags-column 0
			org-auto-align-tags nil
			org-catch-invisible-edits 'show-and-error
			org-special-ctrl-a/e t
			org-insert-heading-respect-content t
			org-hide-emphasis-markers t
			org-pretty-entities t)

(with-eval-after-load 'org (global-org-modern-mode))

(add-hook 'org-mode-hook 'evil-org-mode)

(add-hook 'org-mode-hook 'toc-org-mode)

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.7))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.6))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.4))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.3))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.2))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.1)))))

(defun dt/org-colors-gruvbox-dark ()
  "Enable Gruvbox Dark colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#458588" ultra-bold)
         (org-level-2 1.6 "#b16286" extra-bold)
         (org-level-3 1.5 "#98971a" bold)
         (org-level-4 1.4 "#fb4934" semi-bold)
         (org-level-5 1.3 "#83a598" normal)
         (org-level-6 1.2 "#d3869b" normal)
         (org-level-7 1.1 "#d79921" normal)
         (org-level-8 1.0 "#8ec07c" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(setq org-src-preserve-indentation t)

(evil-mode t)
(setq evil-want-integration t
      evil-want-keybinding nil)

(global-anzu-mode t)

(general-define-key
	:states '(normal visual)
	"C-=" 'text-scale-increase
	"C--" 'text-scale-decrease
	"gc" 'comment-line
	"ff" 'zoxide-find-file
	"tt" 'vterm-toggle)

(dashboard-setup-startup-hook)
(setq dashboard-set-heading-icons t
			dashboard-set-file-icons t
			dashboard-banner-logo-title "hezaki?"
			dashboard-startup-banner 'logo
			dashboard-center-content t
			dashboard-show-shortcuts nil
			dashboard-vertically-center-content t
			dashboard-set-heading-icons t
			dashboard-set-file-icons t)

(global-corfu-mode t)
(setq corfu-auto t
      corfu-auto-delay 0
      corfu-auto-prefix 1 
      completion-styles '(basic)
      tab-always-indent 'complete)

(add-hook 'dired-mode-hook #'all-the-icons-dired-mode)
(add-hook 'prog-mode-hook #'tree-sitter-hl-mode)
(add-hook 'prog-mode-hook #'rainbow-mode)

(beacon-mode t)

(setq redisplay-dont-pause t
  		scroll-margin 5
			scroll-step 1
			scroll 100000
			scrool-preserve-screen-position 1)

(electric-pair-mode t)
(set-window-margins (selected-window) 0 0)
(set-frame-parameter nil 'internal-border-width 0)
(setq-default tab-width 2)
(setq standard-indent 2
    	inferior-lisp-program "sbcl"
			inhibit-compacting-font-caches t
			auto-save-interval 1000
			package-enable-at-startup nil
			pixel-resolution-fine-flag t
			select-enable-clipboard t
			indent-line-function 'insert-tab
			line-spacing 0
			inhibit-startup-screen t
			make-backup-files nil)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(vertico-mode t)
(setq completion-in-region-function
      (lambda (&rest args)
        (apply (if vertico-mode
          #'completion--in-region)
        args)))

(global-flycheck-mode t)

(setq completion-styles '(orderless basic)
			completion-category-defaults nil
    	completion-category-overrides '((file (styles basic partial-completion))))

(lsp-ui-mode t)
(setq lsp-ui-sideline-enable nil)

(doom-modeline-mode 1)
(setq doom-modeline-icon t
			doom-modeline-bar-width 0
			doom-modeline-buffer-state-icon t
			doom-modeline-major-mode-color-icon t
			doom-modeline-persp-name t
      doom-modeline-persp-icon t)

(centaur-tabs-mode t)
(setq centaur-tabs-style "zigzag"
			centaur-tabs-set-icons t
			centaur-tabs-set-close-button nil
			centaur-tabs-show-new-tab-button nil)

(marginalia-mode t)

(gcmh-mode t)
(setq gc-cons-threshold 402653184
			gc-cons-percentage 0.4)
(add-hook 'emacs-startup-hook
	(lambda ()
	(message "*** Emacs loaded in %s with %d garbage collections."
			(format "%.2f seconds"
			(float-time
			(time-subtract after-init-time before-init-time)))
			gcs-done)))
