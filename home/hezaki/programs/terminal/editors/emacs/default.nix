{ pkgs, ... }:{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    extraPackages = epkgs: with epkgs; [
		  all-the-icons
			tree-sitter-langs
      evil
      vertico
      org
      zen-mode
      lsp-mode
      lsp-ui
			company
			orderless
			telega
			flycheck
			catppuccin-theme
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

			(setq standard-indent 2)
			(set-frame-font "JetBrainsMono NF 11" nil t)
			(load-theme 'catppuccin :no-confirm)
			(set-frame-parameter nil 'internal-border-width 0)
			(setq pixel-resolution-fine-flag t)
      (setq select-enable-clipboard t)
      (setq evil-want-keybinding nil)
      (setq-default tab-width 2)
			(setq line-spacing 0)
			(setq completion-styles '(orderless basic)
				completion-category-overrides '((file (styles basic partial-completion))))
      (evil-mode t)
			(smooth-scrolling-mode t)
			(vertico-mode t)
			(company-mode t)
			(flycheck-mode t)
			(org-mode t)
			(tree-sitter-mode t)
			(pixel-scroll-precision-mode t)
			(add-hook 'after-init-hook 'global-company-mode)
    '';
  };
}
