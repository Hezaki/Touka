{ pkgs, ... }:{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    extraPackages = epkgs: with epkgs; [
      doom-themes
      doom-modeline
      all-the-icons
      all-the-icons-dired
      centaur-tabs
      ligature
      dashboard

      tree-sitter
      tree-sitter-langs

      evil
      evil-org
      evil-anzu
      slime
      magit
      beacon
      gcmh
      marginalia
      rainbow-mode
      rainbow-delimiters
      corfu
      affe
      counsel
      emojify-logos
      vertico
      hl-todo
      vterm
      vterm-toggle
      lspce
      lsp-ui
      lsp-mode
      pdf-tools
      flycheck
      sideline-flycheck
      general
      nixos-options
      password-store
      telega

      org
      org-modern
      org-bullets
      org-download
      toc-org
      org-roam
			nix-mode
    ];
    extraConfig = ''
       (org-babel-load-file
         (expand-file-name
           "/etc/nixos/home/hezaki/programs/terminal/editors/emacs/config.org"
         ))
    '';
  };
}
