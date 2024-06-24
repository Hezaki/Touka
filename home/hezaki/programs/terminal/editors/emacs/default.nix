{ pkgs, ... }:{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    extraPackages = epkgs: with epkgs; [
      doom-modeline
      all-the-icons
      all-the-icons-dired
      tree-sitter
      tree-sitter-langs
      evil
      evil-collection
      evil-org
      evil-anzu
      smartparens
      buffer-expose
      insert-shebang
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
      emojify-logos
      vertico
      hl-todo
      vterm
      general
      password-store
			orderless
      apheleia
      olivetti
      dired-hacks-utils
      nixos-options
      org
      org-bullets
      org-modern
      org-download
      org-present
      org-auto-tangle
      toc-org
      valign
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
