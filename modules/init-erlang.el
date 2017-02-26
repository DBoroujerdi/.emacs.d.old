
(use-package erlang-mode
  :mode "\\.erl\\'"
  :init
  ;; create erlang_home var for use below - this is where erlang is installed
  (defvar erlang_home "~/apps/erlang/")

  ;; load erlang mode directly from erlang source
  (setq load-path (cons "~/apps/erlang/lib/tools-*/emacs/" load-path))


  :config
  ;; set the erlang root dir, presumably used by erlang-mode
  (setq erlang-root-dir erlang_home)

  ;; append erlang bin to the emacs path - equivalent to bash PATH
  (setq exec-path (cons (concat erlang_home "bin") exec-path))

  (require 'erlang-start)

  ;; optional
  (add-hook 'erlang-mode-hook '(lambda() (setq indent-tabs-mode nil)))

  ;; (require 'erlang-flymake)
  (global-flycheck-mode -1)

  (add-hook 'erlang-mode-hook (lambda () (highlight-symbol-mode 1)))
  ;; (add-hook 'erlang-mode-hook 'flyspell-prog-mode)
  (require 'fill-column-indicator)

  (setq-default fill-column 80)
  (setq-default fci-rule-width 1)
  (setq-default fci-rule-color "#686868")
  (add-hook 'erlang-mode-hook 'fci-mode)
  (fci-mode)

  ;; tell ido to ignore beam files when completions
  (add-to-list 'completion-ignored-extensions ".beam")

  (add-to-list 'auto-mode-alist '("\\.term\\'" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.terms\\'" . erlang-mode))

  (setq erlang-indent-level 4)

  ;; (add-hook 'erlang-mode-hook 'aggressive-indent-mode)


  )


(use-package edts-mode
  :disabled

  :config
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
  )


(provide 'init-erlang)
