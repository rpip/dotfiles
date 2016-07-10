(add-hook 'after-init-hook
	  (lambda ()
            (require 'server)
            (unless (server-running-p)
	      (server-start))))

(add-hook 'after-init-hook 'global-flycheck-mode)

(add-hook 'prelude-prog-mode-hook 'disable-guru-mode t)

(add-hook 'haskell-mode-hook #'hindent-mode)

(add-hook 'prog-mode-hook 'fci-mode)

(add-hook 'prog-mode-hook 'highlight-beyond-fill-column)

(add-hook 'js-mode-hook 'js2-minor-mode)

(add-hook 'before-save-hook 'jsfmt-before-save)

;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'whitespace-cleanup)

(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(defun colend-html-to-jinja2 ()
  (let ((name (buffer-file-name (current-buffer))))
    (when (string-match "^.*?/octopus/colend/templates.*?" name)
      (jinja2-mode))))

(add-hook 'find-file-hook 'colend-html-to-jinja2)
