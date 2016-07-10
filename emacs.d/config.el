(add-to-list 'load-path "~/.emacs.d/personal/config")

(defun package-require (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(require 'python-config)
(require 'org-config)
(require 'nav-config)
(require 'org-page-config)
(require 'diminish-config)
(require 'tabbar-config)
(require 'bodil-ido-config)
(require 'bodil-terminal-config)
(require 'mu4e-config)
