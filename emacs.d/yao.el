(add-to-list 'load-path "~/.emacs.d/personal")

(load "custom")
(load "defuns")
(load "auto-modes")
(load "theme")
(load "hooks")
(load "config")
(load "packages")

;; disable menu-bar-mode, tool-bar-mode and scroll-bar-mode
(dolist (mode '(tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

(global-company-mode)

;; recent files
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(recentf-open-files)

(recentf-mode 1)
