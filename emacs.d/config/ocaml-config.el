(require 'ocp-indent)
(require 'merlin)

;; bind C-c C-r to eval region when in Merlin mode
(defun merlin-send-region(start end)
  (interactive "r") ;;Make the custom function interactive and operative on a region
  (append-to-buffer (get-buffer "*ocaml-toplevel*") start end) ;;append to the buffer named *ocaml-toplevel*
  (switch-to-buffer-other-window (get-buffer "*ocaml-toplevel*")) ;;switches to the buffer
  (execute-kbd-macro "\C-m")) ;;sends the enter keystroke to the buffer

(eval-after-load 'merlin
  '(define-key merlin-mode-map (kbd "C-c C-r") 'merlin-send-region))


(provide 'ocaml-config)
;;; ocaml-config.el ends here
