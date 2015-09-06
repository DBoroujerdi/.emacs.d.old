
;; ========= Puppet ================

;; Start puppet-mode when editing a .pp file
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
(require 'flymake-puppet)
(add-hook 'puppet-mode-hook (lambda () (flymake-puppet-load)))

;; other useful things
(add-to-list 'auto-mode-alist '("\\Vagrantfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

(provide 'init-puppet)
