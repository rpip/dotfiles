;; Unclutter the modeline
(require 'diminish)

(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "ethan-wspace" '(diminish 'ethan-wspace-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "rainbow-mode" '(diminish 'rainbow-mode))
(eval-after-load "paredit" '(diminish 'paredit-mode))
(eval-after-load "autopair" '(diminish 'autopair-mode))
(eval-after-load "abbrev" '(diminish 'abbrev-mode))
(eval-after-load "company" '(diminish 'company-mode))
(eval-after-load "js2-highlight-vars" '(diminish 'js2-highlight-vars-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "mmm-mode" '(diminish 'mmm-mode))
(eval-after-load "skewer-html" '(diminish 'skewer-html-mode))
(eval-after-load "skewer-mode" '(diminish 'skewer-mode))
(eval-after-load "auto-indent-mode" '(diminish 'auto-indent-minor-mode))
(eval-after-load "highlight-parentheses" '(diminish 'highlight-parentheses-mode))
;; (eval-after-load "subword" '(diminish 'subword-mode))
(eval-after-load "anzu" '(diminish 'anzu-mode))
(eval-after-load "cider" '(diminish 'cider-mode))
(eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "git-gutter" '(diminish 'git-gutter-mode))
(eval-after-load "magit" '(diminish 'magit-auto-revert-mode))

(eval-after-load "js2-modex"
  '(defadvice js2-mode (after js2-rename-modeline activate)
     (setq mode-name "JS+")))
(eval-after-load "nxhtml-mode"
  '(defadvice nxhtml-mode (after nxhtml-rename-modeline activate)
     (setq mode-name "HTML")))
(eval-after-load "js"
  '(defadvice js-mode (after js-rename-modeline activate)
     (setq mode-name "JS")))
(defadvice emacs-lisp-mode (after elisp-rename-modeline activate)
  (setq mode-name "ELisp"))

(eval-after-load "guide-key"
  '(diminish 'guide-key-mode))

(eval-after-load "undo-tree"
  '(diminish 'undo-tree-mode))

(eval-after-load "yas-minor-mode"
  '(diminish 'yas-minor-mode))

(eval-after-load "auto-complete"
  '(diminish 'auto-complete-mode))

(eval-after-load "flyspell"
  '(diminish 'flyspell-mode))

(eval-after-load "whitespace-cleanup-mode"
  '(diminish 'whitespace-cleanup-mode))

(eval-after-load 'flycheck
  '(diminish 'flycheck-mode))

(diminish 'abbrev-mode)
(eval-after-load 'auto-revert-mode
  '(diminish 'auto-revert-mode))

(eval-after-load 'magit-wip
  '(diminish 'magit-wip-save-mode))

(eval-after-load "elpy"
  '(diminish 'elpy-mode))

(eval-after-load "python-mode"
  '(diminish 'python-mode))

(eval-after-load "anaconda-mode"
  '(diminish 'anaconda-mode))

(provide 'diminish-config)
;;; diminish-config.el ends here
