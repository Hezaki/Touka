{ inputs, pkgs, ... }:
{
  imports = [ inputs.nix-doom-emacs-unstraightened.hmModule ];

  programs.doom-emacs = {
    enable = true;
    experimentalFetchTree = true;
    emacs = pkgs.emacs29-pgtk;
    doomDir = ./doom.d;
  };

  xdg.configFile = {
    "doom.d/init.el".text = ''
      ;;; init.el -*- lexical-binding: t; -*-

      ;; this file controls what doom modules are enabled and what order they load
      ;; in. remember to run 'doom sync' after modifying it!

      ;; note press 'spc h d h' (or 'c-h d h' for non-vim users) to access doom's
      ;;      documentation. there you'll find a link to doom's module index where all
      ;;      of our modules are listed, including what flags they support.

      ;; note move your cursor over a module's name (or its flags) and press 'k' (or
      ;;      'c-c c k' for non-vim users) to view its documentation. this works on
      ;;      flags as well (those symbols that start with a plus).
      ;;
      ;;      alternatively, press 'gd' (or 'c-c c d') on a module to browse its
      ;;      directory (for easy access to its source code).

      (doom! :input
             ;;bidi              ; (tfel ot) thgir etirw uoy gnipleh
             ;;chinese
             ;;japanese
             ;;layout            ; auie,ctsrnm is the superior home row

             :completion
             ;;company           ; the ultimate code completion backend
             (corfu +orderless)  ; complete with cap(f), cape and a flying feather!
             ;;helm              ; the *other* search engine for love and life
             ;;ido               ; the other *other* search engine...
             ;;ivy               ; a search engine for love and life
             vertico           ; the search engine of the future

             :ui
             ;;deft              ; notational velocity for emacs
             doom              ; what makes doom look the way it does
             doom-dashboard    ; a nifty splash screen for emacs
             ;;doom-quit         ; doom quit-message prompts when you quit emacs
             (emoji +unicode)  ; 🙂
             hl-todo           ; highlight todo/fixme/note/deprecated/hack/review
             ;;indent-guides     ; highlighted indent columns
             ;;ligatures         ; ligatures and symbols to make your code pretty again
             ;;minimap           ; show a map of the code on the side
             modeline          ; snazzy, atom-inspired modeline, plus api
             ;;nav-flash         ; blink cursor line after big motions
             ;;neotree           ; a project drawer, like nerdtree for vim
             ophints           ; highlight the region an operation acts on
             (popup +defaults)   ; tame sudden yet inevitable temporary windows
             ;;tabs              ; a tab bar for emacs
             ;;treemacs          ; a project drawer, like neotree but cooler
             ;;unicode           ; extended unicode support for various languages
             (vc-gutter +pretty) ; vcs diff in the fringe
             vi-tilde-fringe   ; fringe tildes to mark beyond eob
             ;;window-select     ; visually switch windows
             workspaces        ; tab emulation, persistence & separate workspaces
             ;;zen               ; distraction-free coding or writing

             :editor
             (evil +everywhere); come to the dark side, we have cookies
             file-templates    ; auto-snippets for empty files
             fold              ; (nigh) universal code folding
             ;;(format +onsave)  ; automated prettiness
             ;;god               ; run emacs commands without modifier keys
             ;;lispy             ; vim for lisp, for people who don't like vim
             ;;multiple-cursors  ; editing in many places at once
             ;;objed             ; text object editing for the innocent
             ;;parinfer          ; turn lisp into python, sort of
             ;;rotate-text       ; cycle region at point between text candidates
             snippets          ; my elves. they type so i don't have to
             ;;word-wrap         ; soft wrapping with language-aware indent

             :emacs
             dired             ; making dired pretty [functional]
             electric          ; smarter, keyword-based electric-indent
             ;;ibuffer         ; interactive buffer management
             undo              ; persistent, smarter undo for your inevitable mistakes
             vc                ; version-control and emacs, sitting in a tree

             :term
             ;;eshell            ; the elisp shell that works everywhere
             ;;shell             ; simple shell repl for emacs
             ;;term              ; basic terminal emulator for emacs
             ;;vterm             ; the best terminal emulation in emacs

             :checkers
             syntax              ; tasing you for every semicolon you forget
             ;;(spell +flyspell) ; tasing you for misspelling mispelling
             ;;grammar           ; tasing grammar mistake every you make

             :tools
             ;;ansible
             ;;biblio            ; writes a phd for you (citation needed)
             ;;collab            ; buffers with friends
             ;;debugger          ; fixme stepping through code, to help you add bugs
             ;;direnv
             ;;docker
             ;;editorconfig      ; let someone else argue about tabs vs spaces
             ;;ein               ; tame jupyter notebooks with emacs
             (eval +overlay)     ; run code, run (also, repls)
             lookup              ; navigate your code and its documentation
             ;;lsp               ; m-x vscode
             magit             ; a git porcelain for emacs
             ;;make              ; run make tasks from emacs
             ;;pass              ; password manager for nerds
             ;;pdf               ; pdf enhancements
             ;;prodigy           ; fixme managing external services & code builders
             ;;terraform         ; infrastructure as code
             ;;tmux              ; an api for interacting with tmux
             ;;tree-sitter       ; syntax and parsing, sitting in a tree...
             ;;upload            ; map local to remote projects via ssh/ftp

             :os
             (:if (featurep :system 'macos) macos)  ; improve compatibility with macos
             ;;tty               ; improve the terminal emacs experience

             :lang
             ;;agda              ; types of types of types of types...
             ;;beancount         ; mind the gaap
             ;;(cc +lsp)         ; c > c++ == 1
             ;;clojure           ; java with a lisp
             ;;common-lisp       ; if you've seen one lisp, you've seen them all
             ;;coq               ; proofs-as-programs
             ;;crystal           ; ruby at the speed of c
             ;;csharp            ; unity, .net, and mono shenanigans
             ;;data              ; config/data formats
             ;;(dart +flutter)   ; paint ui and not much else
             ;;dhall
             ;;elixir            ; erlang done right
             ;;elm               ; care for a cup of tea?
             emacs-lisp        ; drown in parentheses
             ;;erlang            ; an elegant language for a more civilized age
             ;;ess               ; emacs speaks statistics
             ;;factor
             ;;faust             ; dsp, but you get to keep your soul
             ;;fortran           ; in fortran, god is real (unless declared integer)
             ;;fsharp            ; ml stands for microsoft's language
             ;;fstar             ; (dependent) types and (monadic) effects and z3
             ;;gdscript          ; the language you waited for
             ;;(go +lsp)         ; the hipster dialect
             ;;(graphql +lsp)    ; give queries a rest
             ;;(haskell +lsp)    ; a language that's lazier than i am
             ;;hy                ; readability of scheme w/ speed of python
             ;;idris             ; a language you can depend on
             ;;json              ; at least it ain't xml
             ;;(java +lsp)       ; the poster child for carpal tunnel syndrome
             ;;javascript        ; all(hope(abandon(ye(who(enter(here))))))
             ;;julia             ; a better, faster matlab
             ;;kotlin            ; a better, slicker java(script)
             ;;latex             ; writing papers in emacs has never been so fun
             ;;lean              ; for folks with too much to prove
             ;;ledger            ; be audit you can be
             ;;lua               ; one-based indices? one-based indices
             ;markdown          ; writing docs for people to ignore
             ;;nim               ; python + lisp at the speed of c
             nix               ; i hereby declare "nix geht mehr!"
             ;;ocaml             ; an objective camel
             org               ; organize your plain life in plain text
             ;;php               ; perl's insecure younger brother
             ;;plantuml          ; diagrams for confusing people more
             ;;purescript        ; javascript, but functional
             ;;python            ; beautiful is better than ugly
             ;;qt                ; the 'cutest' gui framework ever
             ;;racket            ; a dsl for dsls
             ;;raku              ; the artist formerly known as perl6
             ;;rest              ; emacs as a rest client
             ;;rst               ; rest in peace
             ;;(ruby +rails)     ; 1.step {|i| p "ruby is #{i.even? ? 'love' : 'life'}"}
             ;;(rust +lsp)       ; fe2o3.unwrap().unwrap().unwrap().unwrap()
             ;;scala             ; java, but good
             ;;(scheme +guile)   ; a fully conniving family of lisps
             sh                ; she sells {ba,z,fi}sh shells on the c xor
             ;;sml
             ;;solidity          ; do you need a blockchain? no.
             ;;swift             ; who asked for emoji variables?
             ;;terra             ; earth and moon in alignment for performance.
             ;;web               ; the tubes
             ;;yaml              ; json, but readable
             ;;zig               ; c, but simpler

             :email
             ;;(mu4e +org +gmail)
             ;;notmuch
             ;;(wanderlust +gmail)

             :app
             ;;calendar
             ;;emms
             ;;everywhere        ; *leave* emacs!? you must be joking
             ;;irc               ; how neckbeards socialize
             ;;(rss +org)        ; emacs as an rss reader

             :config
             ;;literate
             (default +bindings +smartparens))
    '';
    "doom.d/package.el".text = ''
      ;; -*- no-byte-compile: t; -*-
      ;;; $doomdir/packages.el

      ;; to install a package with doom you must declare them here and run 'doom sync'
      ;; on the command line, then restart emacs for the changes to take effect -- or
      ;; use 'm-x doom/reload'.


      ;; to install some-package from melpa, elpa or emacsmirror:
      ;; (package! some-package)

      ;; to install a package directly from a remote git repo, you must specify a
      ;; `:recipe'. you'll find documentation on what `:recipe' accepts here:
      ;; https://github.com/radian-software/straight.el#the-recipe-format
      ;; (package! another-package
      ;;   :recipe (:host github :repo "username/repo"))

      ;; if the package you are trying to install does not contain a packagename.el
      ;; file, or is located in a subdirectory of the repo, you'll need to specify
      ;; `:files' in the `:recipe':
      ;; (package! this-package
      ;;   :recipe (:host github :repo "username/repo"
      ;;            :files ("some-file.el" "src/lisp/*.el")))

      ;; if you'd like to disable a package included with doom, you can do so here
      ;; with the `:disable' property:
      ;; (package! builtin-package :disable t)

      ;; you can override the recipe of a built in package without having to specify
      ;; all the properties for `:recipe'. these will inherit the rest of its recipe
      ;; from doom or melpa/elpa/emacsmirror:
      ;; (package! builtin-package :recipe (:nonrecursive t))
      ;; (package! builtin-package-2 :recipe (:repo "myfork/package"))

      ;; specify a `:branch' to install a package from a particular branch or tag.
      ;; this is required for some packages whose default branch isn't 'master' (which
      ;; our package manager can't deal with; see radian-software/straight.el#279)
      ;; (package! builtin-package :recipe (:branch "develop"))

      ;; use `:pin' to specify a particular commit to install.
      ;; (package! builtin-package :pin "1a2b3c4d5e")


      ;; doom's packages are pinned to a specific commit and updated from release to
      ;; release. the `unpin!' macro allows you to unpin single packages...
      ;; (unpin! pinned-package)
      ;; ...or multiple packages
      ;; (unpin! pinned-package another-pinned-package)
      ;; ...or *all* packages (not recommended; will likely break things)
      ;; (unpin! t)
    '';
    "doom.d/config.el".text = ''
      ;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

      ;; Place your private configuration here! Remember, you do not need to run 'doom
      ;; sync' after modifying this file!


      ;; Some functionality uses this to identify you, e.g. GPG configuration, email
      ;; clients, file templates and snippets. It is optional.
      ;; (setq user-full-name "John Doe"
      ;;       user-mail-address "john@doe.com")

      ;; Doom exposes five (optional) variables for controlling fonts in Doom:
      ;;
      ;; - `doom-font' -- the primary font to use
      ;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
      ;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
      ;;   presentations or streaming.
      ;; - `doom-symbol-font' -- for symbols
      ;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
      ;;
      ;; See 'C-h v doom-font' for documentation and more examples of what they
      ;; accept. For example:
      ;;
      ;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
      ;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
      ;;
      ;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
      ;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
      ;; refresh your font settings. If Emacs still can't find your font, it likely
      ;; wasn't installed correctly. Font issues are rarely Doom issues!

      ;; There are two ways to load a theme. Both assume the theme is installed and
      ;; available. You can either set `doom-theme' or manually load a theme with the
      ;; `load-theme' function. This is the default:
      (setq doom-theme 'doom-one)

      ;; This determines the style of line numbers in effect. If set to `nil', line
      ;; numbers are disabled. For relative line numbers, set this to `relative'.
      (setq display-line-numbers-type t)

      ;; If you use `org' and don't want your org files in the default location below,
      ;; change `org-directory'. It must be set before org loads!
      (setq org-directory "~/Documents/Notes")


      ;; Whenever you reconfigure a package, make sure to wrap your config in an
      ;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
      ;;
      ;;   (after! PACKAGE
      ;;     (setq x y))
      ;;
      ;; The exceptions to this rule:
      ;;
      ;;   - Setting file/directory variables (like `org-directory')
      ;;   - Setting variables which explicitly tell you to set them before their
      ;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
      ;;   - Setting doom variables (which start with 'doom-' or '+').
      ;;
      ;; Here are some additional functions/macros that will help you configure Doom.
      ;;
      ;; - `load!' for loading external *.el files relative to this one
      ;; - `use-package!' for configuring packages
      ;; - `after!' for running code after a package has loaded
      ;; - `add-load-path!' for adding directories to the `load-path', relative to
      ;;   this file. Emacs searches the `load-path' when you load packages with
      ;;   `require' or `use-package'.
      ;; - `map!' for binding new keys
      ;;
      ;; To get information about any of these functions/macros, move the cursor over
      ;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
      ;; This will open documentation for it, including demos of how they are used.
      ;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
      ;; etc).
      ;;
      ;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
      ;; they are implemented.
    '';
  };
}
