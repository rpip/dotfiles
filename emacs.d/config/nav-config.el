(require 'nav)

(nav-disable-overeager-window-splitting)

;; C-x n for nav toggling
(global-set-key (kbd "C-x n") 'nav-toggle)

;; bind the f3 key to the timestamp function
(global-set-key (kbd "<f3>") 'timestamp)

(provide 'nav-config)
;;; nav-config.el ends here
