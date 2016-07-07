(defvar yao-pkgs
  '(flycheck
    header2
    powerline
    nav
    alchemist
    js2-mode
    fill-column-indicator
    nodejs-repl
    browse-at-remote
    jsfmt
    ob-elixir
    lorem-ipsum
    diminish
    ))

;; install packages
(dolist (package yao-pkgs)
  (package-require package))

;; now load the must-haves
(dolist (package yao-pkgs)
  (require package))
