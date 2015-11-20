
(defvar erlang_home "~/apps/erlang/")

(setq load-path (cons "~/apps/erlang/lib/tools-*/emacs/" load-path))

(setq erlang-root-dir erlang_home)
(setq exec-path (cons (concat erlang_home "bin") exec-path))

(require 'erlang-start)

(add-hook 'erlang-mode-hook '(lambda() (setq indent-tabs-mode nil)))

;; (require 'erlang-flymake)
(global-flycheck-mode -1)

(add-hook 'erlang-mode-hook (lambda () (highlight-symbol-mode 1)))
(add-hook 'erlang-mode-hook 'flyspell-prog-mode)

(require 'column-marker)
(add-hook 'erlang-mode-hook
          (lambda () (interactive) (column-marker-1 80)))


;; tell ido to ignore beam files when completions
(add-to-list 'completion-ignored-extensions ".beam")

(add-to-list 'auto-mode-alist '("\\.term\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.terms\\'" . erlang-mode))

(setq erlang-indent-level 4)

;; (add-hook 'erlang-mode-hook 'aggressive-indent-mode)


(add-hook 'after-init-hook 'edts-after-init-hook)
(defun edts-after-init-hook ()
   (require 'edts-start))

'(edts-man-root "~/.emacs.d/edts/doc/17.5")


;;;; AUTO GENERATED ;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ac2b1fed9c0f0190045359327e963ddad250e131fbf332e80d371b2e1dbc1dc4" default)))
 '(edts-man-root "/home/dborouje/.emacs.d/edts/doc/17.5"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init-erlang)
