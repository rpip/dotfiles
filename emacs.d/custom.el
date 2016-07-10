;; custom
(require 'highlight-beyond-fill-column)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(add-log-email-address "yao.adzaku@gmail.com")
 '(add-log-full-name "Yao Adzaku")
 '(backup-by-copying t)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("133222702a3c75d16ea9c50743f66b987a7209fb8b964f2c0938a816a83379a0" "2a5be663818e1e23fd2175cc8dac8a2015dcde6b2e07536712451b14658bbf68" "aab598c4d024d544b4e8b356a95ca693afa9de000b154bd2f86eed68c9e75557" "e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" "b5fe3893c8808466711c1b55bb7e66b9c6aa2a86811783375a43e1beabb1af33" "532769a638787d1196bc22c885e9b85269c3fc650fdecfc45135bb618127034c" "beeb5ac6b65fcccfe434071d4624ff0308b5968bf2f0c01b567d212bcaf66054" "2d7e4feac4eeef3f0610bf6b155f613f372b056a2caae30a361947eab5074716" "be50a45342f47158a8d34f54ffecc63f55dbdf66ad672c171c48e9dac56fff52" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default)))
 '(fill-column 80)
 '(font-use-system-font t)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode t)
 '(org-todo-keywords (quote ((sequnce "TODO(t)" "CANCELLED(c@)" "DONE(d!)"))))
 '(recentf-mode 1)
 '(show-paren-mode t)
 '(user-full-name "Yao Adzaku")
 '(user-mail-address "yao.adzaku@gmail.com")
 '(x-select-enable-clipboard t))

;; set default font size
(set-face-attribute 'default nil :height 160)

;; frame width and height
(add-to-list 'default-frame-alist '(height . 80))
(add-to-list 'default-frame-alist '(width . 120))

;; colour matching parens
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-beyond-fill-column-face ((t (:foreground "red"))))
 '(show-paren-match ((t (:underline "#8b8682" :background "#ddd")))))

;; alias 'y' and 'n' to 'yes' or 'no'
(fset 'yes-or-no-p 'y-or-n-p)
(defalias 'yes-or-no-p 'y-or-n-p)

;; start emacs-server if not running
(setq server-socket-dir "/tmp/emacs-shared")

;; backups
(setq make-backup-file-name-function 'yao-backup-file-name)

(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat prelude-personal-dir "bak")))))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; KEY BINDINGS

;; bind tab key to smart-tab
(global-set-key [(tab)] 'smart-tab)

;; set F7 to toggle scroll bar
(global-set-key (kbd "<f7>") 'toggle-scroll-bar)

;; bind Ctrl-l to goto-line
(global-set-key (kbd "C-l") 'goto-line)

;; easy keys to split window
(global-set-key (kbd "M-0") 'delete-window) ; close current pane
(global-set-key (kbd "M-1") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-2") 'split-window-vertically) ; split pane top/bottom
(global-set-key (kbd "M-3") 'split-window-ho2014-10-09T03:02:55rizontally) ; split pane top/bottom
(global-set-key (kbd "M-o") 'other-window) ; cursor to other pane
(global-set-key [f5] 'refresh-file)

;; setup redo shortcuts
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "C-S-z") 'redo) ; 【Ctrl+Shift+z】;  Mac style

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; browse-at-remote
(require 'browse-at-remote)
(global-set-key (kbd "C-c g g") 'browse-at-remote)
