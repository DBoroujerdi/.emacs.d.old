;; ========= Golang ================

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(setenv "GOPATH" (concat (getenv "HOME")  "/projects/go"))
(setenv "PATH" (concat (getenv "PATH") ":" (concat (getenv "HOME") "/apps/go/bin")))

(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)

;; auto-completion
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/nsf/gocode/emacs-company"))
(require 'company-go)

;; flycheck
(add-hook 'go-mode-hook #'global-flycheck-mode)

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

;; eldoc support for go
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)


;; KEYS
;; remove unused imports
(add-hook 'go-mode-hook '(lambda ()
			   (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
;; go to imports
(add-hook 'go-mode-hook '(lambda ()
			   (local-set-key (kbd "C-c C-g") 'go-goto-imports)))
;; godoc
(add-hook 'go-mode-hook '(lambda ()
			   (local-set-key (kbd "C-c C-k") 'godoc)))

(provide 'init-go)
