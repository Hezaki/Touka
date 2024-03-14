{ pkgs, ... }:{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraPackages = epkgs: with epkgs; [
			all-the-icons
			all-the-icons-completion
			tree-sitter-langs
      evil
      vertico
      org
      zen-mode
      lsp-mode
      lsp-ui
			catppuccin-theme
			company
			flycheck
			indent-guide
    ];
    extraConfig = ''
      (custom-set-variables
        '(global-display-line-numbers-mode t)
				'(global-tree-sitter-mode)
        '(menu-bar-mode nil)
        '(scroll-bar-mode nil)
        '(tab-bar-mode t)
        '(tool-bar-mode nil)
        '(recentf-mode t))

      (custom-set-faces)

			(set-frame-font "JetBrainsMono NF 11" nil t)
			(load-theme 'catppuccin :no-confirm)
			(set-frame-parameter nil 'internal-border-width 0t
      (setq select-enable-clipboard t)
      (setq evil-want-keybinding nil)
      (setq-default tab-width 2)
			(setq line-spacing nil)
      (evil-mode t)
			(global-evil-surround-mode t)
			(evil-commentary-mode t)
			(vertico-mode t)
			(require 'tree-sitter)
      (require 'tree-sitter-langs)
      (require 'all-the-icons)
      (require 'company)
      (require 'indent-guide)
      (require 'flycheck)
      (require 'lsp-mode)
      (require 'lsp-ui)
      (add-hook 'dired-mode-hook
        (lambda ()
          (setq-local dired-listing-switches "-alh --group-directories-first")
          (setq dired-use-ls-dired nil)
          (setq dired-directory-listing-format
             '((lambda (dir)
                (concat (all-the-icons-dired-dir-icon dir) " " dir)))))
    '';
  };
}
