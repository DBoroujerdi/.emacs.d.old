(add-to-list 'load-path "/usr/local/Cellar/mu/default/share/emacs/site-lisp/mu/mu4e")
(require 'mu4e)
(setq mu4e-mu-binary "/usr/local/bin/mu")
(setq mu4e-maildir "~/.mail/gmail")

;; render html content in emails
(require 'mu4e-contrib)
(setq mu4e-html2text-command 'mu4e-shr2text)

;; try to emulate some of the eww key-bindings
(add-hook 'mu4e-view-mode-hook
          (lambda ()
            (local-set-key (kbd "<tab>") 'shr-next-link)
            (local-set-key (kbd "<backtab>") 'shr-previous-link)))

;; show embedded images
(setq mu4e-view-show-images t)

;; something about myself
(setq user-mail-address "daniel.boroujerdi@gmail.com"
      user-full-name  "Daniel Boroujerdi"
      mu4e-compose-signature
      (concat "Daniel Boroujerdi\n" "http://github.com/dboroujerdi\n"))

;; send mail smtp
;; (setq message-send-mail-function 'smtpmail-send-it
;;       smtpmail-stream-type 'starttls
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587)

;; send mail
(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      user-mail-address "daniel.boroujerdi@gmail.com"
      smtpmail-starttls-credentials '(("smtp.gmail.com" "587" nil nil))
      smtpmail-auth-credentials (expand-file-name "~/.authinfo")
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t
      starttls-extra-arguments nil
      starttls-gnutls-program "/usr/local/bin/gnutls-cli"
      starttls-extra-arguments nil
      starttls-use-gnutls t)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

(provide 'init-mail)
