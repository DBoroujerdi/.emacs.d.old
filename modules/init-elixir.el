;;
;; mode config
;;

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

    (add-hook 'erlang-mode-hook 'custom-erlang-mode-hook)
    )
  )

(provide 'init-elixir)
