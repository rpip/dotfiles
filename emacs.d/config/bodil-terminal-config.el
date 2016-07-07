(require 'ansi-color)
(package-require 'multi-term)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(global-set-key (kbd "C-x C-m") 'multi-term)
(global-set-key (kbd "C-x m") 'multi-term-next)

;; Likewise, yasnippet breaks the tab key.
(add-hook 'term-mode-hook
	  (lambda() (yas-minor-mode -1)))

(autoload 'bash-completion-dynamic-complete
  "bash-completion"
  "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
	  'bash-completion-dynamic-complete)
(add-hook 'shell-command-complete-functions
	  'bash-completion-dynamic-complete)

;; tab-completion for shell-command
(require 'shell-command)
(shell-command-completion-mode)

(defun ash-term-hooks ()
  ;; dabbrev-expand in term
  (define-key term-raw-escape-map "/"
    (lambda ()
      (interactive)
      (let ((beg (point)))
	(dabbrev-expand nil)
	(kill-region beg (point)))
      (term-send-raw-string (substring-no-properties (current-kill 0)))))
  ;; yank in term (bound to C-c C-y)
  (define-key term-raw-escape-map "\C-y"
    (lambda ()
      (interactive)
      (term-send-raw-string (current-kill 0))))
  (setq term-default-bg-color (face-background 'default))
  (setq term-default-fg-color (face-foreground 'default)))

(add-hook 'term-mode-hook 'ash-term-hooks)

(provide 'bodil-terminal-config)
;;; bodil-terminal-config.el ends here
