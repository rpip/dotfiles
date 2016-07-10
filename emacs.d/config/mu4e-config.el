(add-to-list 'load-path "/usr/local/Cellar/mu/HEAD/share/emacs/site-lisp/mu/mu4e")
(require 'mu4e)

(setq mu4e-maildir "~/.mail")

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;;set attachment downloads directory
(setq mu4e-attachment-dir  "~/Downloads")

;; default to HTML view
(setq mu4e-view-prefer-html t)

;; display images
(setq mu4e-view-show-images t
      mu4e-view-image-max-width 800)

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "mbsync -a")
(setq mu4e-update-interval 300)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

(setq mu4e-confirm-quit nil
      mu4e-headers-date-format "%d/%b/%Y %H:%M" ; date format
      mu4e-html2text-command "html2text -utf8 -width 72")

;; setup accounts
(setq mu4e-contexts
      `( ,(make-mu4e-context
           :name "private"
           :enter-func (lambda () (mu4e-message "Switch to the Private context")
                         (setq mu4e-maildir-shortcuts
                               '( ("/private/INBOX"               . ?i)
                                  ("/private/Sent"   . ?s)
                                  ("/private/Trash"       . ?t)
                                  ("/private/Drafts"    . ?d)
                                  )))
           :leave-func (lambda () (mu4e-clear-caches))
           :match-func (lambda (msg)
                         (when msg
                           (mu4e-message-contact-field-matches msg
                                                               :to "yao.adzaku@gamil.com")))
           :vars '((user-mail-address . "yao.adzaku@gamil.com"  )
                   (user-full-name   . "Yao Adzaku" )
                   (mu4e-reply-to-address . "yao.adzaku@gmail.com")
                   (mu4e-compose-signature . "Yao Adzaku")
                   (mu4e-drafts-folder . "/private/[Gmail]/Drafts")
                   (mu4e-sent-folder . "/private/[Gmail]/Sent Mail")
                   (mu4e-trash-folder . "/private/[Gmail]/Trash")))

         ,(make-mu4e-context
           :name "work"
           :enter-func (lambda () (mu4e-message "Switch to the Work context")
                         (setq mu4e-maildir-shortcuts
                               '( ("/work/INBOX"               . ?i)
                                  ("/work/Sent"   . ?s)
                                  ("/work/Trash"       . ?t)
                                  ("/work/Drafts"    . ?d)
                                  )))
           :leave-func (lambda () (mu4e-clear-caches))
           :match-func (lambda (msg)
                         (when msg
                           (mu4e-message-contact-field-matches msg
                                                               :to "yao@octopuslabs.com")))
           :vars '((user-mail-address . "yao@octopuslabs.com" )
                   (user-full-name . "Yao Adzaku" )
                   (mu4e-reply-to-address . "yao@octopuslabs.com")
                   (mu4e-compose-signature . "Yao Adzaku")
                   (mu4e-drafts-folder . "/work/[Gmail]/Drafts")
                   (mu4e-sent-folder . "/work/[Gmail]/Sent Mail")
                   (mu4e-trash-folder . "/work/[Gmail]/Trash")))))


;; setup sending mail with Gmail
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)


;;hotkey to load mu4e
(global-set-key [f1]  'mu4e)

(provide 'mu4e-config)
