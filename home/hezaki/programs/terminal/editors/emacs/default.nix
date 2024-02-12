{ pkgs, ... }:{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraPackages = epkgs: with epkgs; [
      nerd-icons
      nerd-icons-dired
			tree-sitter-langs
      evil
      vertico
      org
      zen-mode
      lsp-mode
      lsp-ui
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

			(set-frame-font "JetBrainsMono NF 10" nil t)
			(load-theme 'catppuccin :no-confirm)
			(set-frame-parameter nil 'internal-border-width 0)
      (setq select-enable-clipboard t)
      (setq evil-want-keybinding nil)
      (setq-default tab-width 2)
			(setq line-spacing 0)
      (evil-mode 1)
			(vertico-mode)
    '';
  };
}