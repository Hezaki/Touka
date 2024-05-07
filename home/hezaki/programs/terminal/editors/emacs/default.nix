{ pkgs, ... }:{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    extraPackages = epkgs: with epkgs; [
      doom-themes
      doom-modeline
      all-the-icons
      all-the-icons-dired
      # centaur-tabs
      ligature
      valign
      dashboard

      tree-sitter
      tree-sitter-langs

      evil
      evil-org
      evil-anzu
      evil-mc
      slime
      magit
      beacon
      gcmh
      marginalia
      rainbow-mode
      rainbow-delimiters
      corfu
      nerd-icons-corfu
      emmet-mode
      cape
      eglot
      affe
      consult
      consult-eglot
      emojify-logos
      vertico
      hl-todo
      vterm
      vterm-toggle
      pdf-tools
      flycheck
      sideline-flycheck
      general
      nixos-options
      password-store
			orderless
      apheleia
      olivetti

      org
      org-modern
      org-download
      org-present
      org-auto-tangle
      toc-org
      org-roam
      org-roam-ui
			nix-mode
      python
    ];
    extraConfig = ''
       (org-babel-load-file
         (expand-file-name
           "/etc/nixos/home/hezaki/programs/terminal/editors/emacs/config.org"
         ))
    '';
  };
}
