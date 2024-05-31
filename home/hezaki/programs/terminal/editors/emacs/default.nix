{ pkgs, ... }:{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    extraPackages = epkgs: with epkgs; [
      # doom-themes
      doom-modeline
      all-the-icons
      all-the-icons-dired
      ligature
      valign

      tree-sitter
      tree-sitter-langs

      evil
      evil-collection
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
      nerd-icons-corfu
      emmet-mode
      cape
      eglot
      affe
      buffer-expose
      emojify-logos
      vertico
      hl-todo
      vterm
      eat
      pdf-tools
      general
      nixos-options
      password-store
			orderless
      apheleia
      olivetti
      dired-hacks-utils
      telega

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
