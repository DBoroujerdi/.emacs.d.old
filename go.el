
;; ========= Golang ================

(setenv "GOPATH" "~/git/go")
(setenv "PATH" (concat (getenv "PATH") ":" "~/git/go/bin"))

;; golang (http://dominik.honnef.co/posts/2013/03/writing_go_in_emacs/)
(add-to-list 'load-path "~/.emacs.d/vendor/go-mode")
;;(require 'go-mode-load)
(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)

;; remove unused imports
(add-hook 'go-mode-hook '(lambda ()
			   (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

;; go to imports
(add-hook 'go-mode-hook '(lambda ()
			   (local-set-key (kbd "C-c C-g") 'go-goto-imports)))

;; godoc
(add-hook 'go-mode-hook '(lambda ()
			   (local-set-key (kbd "C-c C-k") 'godoc)))

;; go-flymake
(add-to-list 'load-path "~/git/go/src/github.com/dougm/goflymake")
(require 'go-flymake)

;; auto-completion

(add-to-list 'load-path "~/git/go/src/github.com/nsf/gocode/emacs-company")
(require 'company-go)

(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection)))))

(require 'go-eldoc) ;; Don't need to require, if you install by package.el
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; =================================
