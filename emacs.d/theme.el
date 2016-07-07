(require 'smart-mode-line)
(sml/setup)
(sml/apply-theme 'respectful)

;; powerline
(require 'powerline)

;; now apply powerline theme
(powerline-default-theme)
(setq powerline-arrow-shape 'arrow)
;;(powerline-reset)
(set-face-attribute 'mode-line nil
		    :foreground "#fdf6e3"
		    :background "#2aa198"
		    :box nil)
(set-face-attribute 'mode-line-inactive nil
		    :box nil)

;; fontify code in code blocks
(setq org-src-fontify-natively t)

(defface org-block-begin-line
  '((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF")))
  "Face used for the line delimiting the begin of source blocks.")

(defface org-block-background
  '((t (:background "#FFFFEA")))
  "Face used for the source block background.")

(defface org-block-end-line
  '((t (:overline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF")))
  "Face used for the line delimiting the end of source blocks.")
