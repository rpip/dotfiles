;;; utility functions

(require 'cl)
(defun esk-online? ()
  (if (and (functionp 'network-interface-list)
	   (network-interface-list))
      (some (lambda (iface)
	      (unless (equal "lo" (car iface))
		(member 'up (first (last (network-interface-info
					  (car iface)))))))
	    (network-interface-list))
    t))

(defun package-require (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(defun joindirs (root &rest dirs)
  "Joins a series of directories together, like Python's os.path.join,
  (dotemacs-joindirs \"/tmp\" \"a\" \"b\" \"c\") => /tmp/a/b/c"
  (if (not dirs)
      root
    (apply 'joindirs
	   (expand-file-name (car dirs) root)
	   (cdr dirs))))

(defun pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
  http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
  this.  The function inserts linebreaks to separate tags that have
  nothing but whitespace between them.  It then indents the markup
  by using nxml's indentation rules.
  http://stackoverflow.com/questions/12492/pretty-printing-xml-files-on-emacs"
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n"))
    (indent-region begin end))
  (message "Ah, much better!"))


(defun read-file-contents (f)
  "Returns contents of file"
  (if (file-exists f)
      (with-temp-buffer
	(insert-file-contents f)
	(buffer-string))))

;; smarttab completion
(defun smart-tab ()
  "This smart tab is minibuffer compliant: it acts as usual in the minibuffer.
  Else, if mark is active, indents region.
  Else if point is at the end of a symbol, expands it.
  Else indents the current line."
  (interactive)
  (if (minibufferp)
      (unless (minibuffer-complete)
	(dabbrev-expand nil))
    (if mark-active
	(indent-region (region-beginning)
		       (region-end))
      (if (looking-at "\\_>")
	  (dabbrev-expand nil)))))


(defun refresh-file ()
  (interactive)
  (revert-buffer t t t))

;; disable guru-mode: https://github.com/bbatsov/prelude/issues/192#issuecomment-6584499
(defun disable-guru-mode ()
  (guru-mode -1))

;; date
(defun date (arg)
  "Inserts the current date at the cursor point"
  (interactive "P")
  (insert (if arg (format-time-string "%d.%m.%Y")
	    (format-time-string "%Y-%m-%d"))))

;; timestamp
(defun timestamp ()
  (interactive)
  (insert (format-time-string "%Y-%m-%dT%H:%M:%S")))


(defun yao-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))


;; make backup to a designated dir, mirroring the full path
(defun yao-backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let* (
	 (backupRootDir (file-name-as-directory (concat prelude-personal-dir "emacs-backup")))
	 (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path, ⁖ “C:”
	 (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
	 )
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath))

(defun yao-new-buffer ()
  "Open a new empty buffer.
URL `http://ergoemacs.org/emacs/emacs_new_empty_buffer.html'
Version 2015-06-12"
  (interactive)
  (let ((xah-buf (generate-new-buffer "untitled")))
    (switch-to-buffer xah-buf)
    (funcall (and initial-major-mode))
    (setq buffer-offer-save t)))

(defun electric-indent-ignore-python (char)
  "Ignore electric indentation for python-mode"
  (if (equal major-mode 'python-mode)
      `no-indent'
    nil))
