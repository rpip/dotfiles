;; Python shell settings
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; try to automagically figure out indentation
(setq py-smart-indentation t)

(defun set-newline-and-indent ()
  "Map the return key with `newline-and-indent'"
  (local-set-key (kbd "RET") 'newline-and-indent))

;; bind Ctrl-C-C to `python-shell-send-region
(add-hook 'python-mode
          (lambda () (local-set-key
                      (kbd "C-c C-c") #'python-shell-send-region)))

(defun electric-indent-ignore-python (char)
  "Ignore electric indentation for python-mode"
  (if (equal major-mode 'python-mode)
      `no-indent'
     nil))

(add-hook 'electric-indent-functions 'electric-indent-ignore-python)

(add-hook 'python-mode-hook  (lambda () (electric-indent-mode +1)))

(add-hook 'python-mode-hook 'set-newline-and-indent)

;; set python indent to 4 spaces
(add-hook 'python-mode-hook
	  (function (lambda ()
		      (setq indent-tabs-mode nil
			    tab-width 4))))
(elpy-enable)

(provide 'python-config)
