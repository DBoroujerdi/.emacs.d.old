;;; package --- Summary

;;; Commentary:

;;; Code:

(use-package company-mode
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)))

(use-package ess-site
  :mode "\\.r\\'"
  :config
  (progn
    (require 'ess-site)
    ))

(use-package yaml-mode
  :mode "\\.yaml\\'")

(use-package highlight-symbol
  :diminish highlight-symbol-mode
  :commands highlight-symbol
  :bind ("C-h" . highlight-symbol))


(use-package popup-imenu
  :commands popup-imenu
  :bind ("M-i" . popup-imenu))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package
  :disabled
  :init
  (add-to-list 'load-path "~/.emacs.d/vendor/circe/lisp")
  :config
  (progn
    (require 'circe)))

(use-package docker-mode
  :disabled
  :config
  (progn
    (docker-global-mode 1)))

(use-package yasnippet
  :disabled
  :diminish yas-minor-mode
  :config
  (progn
    (setq yas-after-exit-snippet-hook '((lambda () (yas-global-mode -1))))
    (setq yas-fallback-behavior 'return-nil)
    (setq yas-triggers-in-field t)
    (setq yas-verbosity 0)
    (setq yas-snippet-dirs (list (concat emacs-d "snippets/")))
    (define-key yas-minor-mode-map [(tab)] nil)
    (define-key yas-minor-mode-map (kbd "TAB") nil)))


(use-package emacs-lisp-mode
  :mode "\\.el\\'"
  :config
  (progn
    (setq indent-tabs-mode nil)
    ;; Keep M-TAB for `completion-at-point'
    (define-key flyspell-mode-map "\M-\t" nil)
    ;; Pretty-print eval'd expressions.
    (define-key emacs-lisp-mode-map
      "\C-x\C-e" 'pp-eval-last-sexp)
    ;; Recompile if .elc exists.
    (add-hook (make-local-variable 'after-save-hook)
              (lambda ()
                (byte-force-recompile default-directory)))
    (define-key emacs-lisp-mode-map
      "\r" 'reindent-then-newline-and-indent))

    (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
    ;; (add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode) ;; Requires Ispell
    (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
    (add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
    )


(use-package alchemist-mode
  :defer t ;; will be loaded by elixir mode
  :init
  ;; point to erlang and elixir language source
  (setq alchemist-goto-erlang-source-dir "~/projects/open-source/otp/")
  (setq alchemist-goto-elixir-source-dir "~/projects/open-source/elixir/")

  :config
  (progn
    ;; redefine the alchemist initial command - i find the normal 'a' difficult to reach
    (setq alchemist-key-command-prefix (kbd "C-c ,")) ;; default: (kbd "C-c a")

    ;; Show compilation output in test report
    (setq alchemist-test-display-compilation-output t)

    ;; Run the whole test suite with 'alchemist-mix-test' after saving a buffer.
    (setq alchemist-hooks-test-on-save t)

    ;; Compile your project with alchemist-mix-compile after saving a buffer.
    (setq alchemist-hooks-compile-on-save t)
    )
  )

(use-package elixir-mode
  :mode "\\.ex\\'" ;; '("\\.ex\\'" ".\\exs\\")
  :config
  (progn
    ;; start company on elixir mode start
    (add-hook 'elixir-mode-hook 'company-mode)

    ;; start alchemist on elixir mode start
    (add-hook 'elixir-mode-hook 'alchemist-mode)

    ;; allows the jumping back out of erlang code
    (defun custom-erlang-mode-hook ()
      (define-key erlang-mode-map (kbd "M-,") 'alchemist-goto-jump-back))

    (add-hook 'erlang-mode-hook 'custom-erlang-mode-hook))
  )

(use-package erlang-mode
  :mode "\\.erl\\'"
  :init
  ;; create erlang_home var for use below - this is where erlang is installed
  (defvar erlang_home "~/apps/erlang/")

  ;; load erlang mode directly from erlang source
  (setq load-path (cons "~/apps/erlang/lib/tools-*/emacs/" load-path))


  :config
  (progn
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
  )


(use-package edts-mode
  :disabled
  :config
  (progn
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
  )

(use-package ensime
  :disabled
  :mode "\\.scala\\'"
  :ensure t
  :pin melpa-stable
  :config
  (progn
    (scala-mode:goto-start-of-code)
    (global-set-key (kbd "C-<backspace>") 'contextual-backspace)

    (defun contextual-backspace ()
      "Hungry whitespace or delete word depending on context."
      (interactive)
      (if (looking-back "[[:space:]\n]\\{2,\\}" (- (point) 2))
          (while (looking-back "[[:space:]\n]" (- (point) 1))
            (delete-char -1))
        (cond
         ((and (boundp 'smartparens-strict-mode)
               smartparens-strict-mode)
          (sp-backward-kill-word 1))
         ((and (boundp 'subword-mode)
               subword-mode)
          (subword-backward-kill 1))
         (t
          (backward-kill-word 1)))))
    ))

(use-package puppet-mode
  :disabled
  :mode "\\.pp$"
  :config
  (progn
    (require 'flymake-puppet)
    (flymake-puppet-load)
    ;; other useful things
    (add-to-list 'auto-mode-alist '("\\Vagrantfile\\'" . ruby-mode))
    (add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
    ))


(provide 'init-packages)
;;; init-packages.el ends here