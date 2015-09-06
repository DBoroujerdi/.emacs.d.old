
;; company mode for autocompletion
;; (add-to-list 'load-path "~/.emacs.d/vendor/company-mode/")
;; (require 'company)


;; company mode in all buffers
(add-hook 'after-init-hook 'global-company-mode)


(provide 'init-company)
