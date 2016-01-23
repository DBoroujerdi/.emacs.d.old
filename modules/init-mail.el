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

(provide 'init-mail)
