(use-package yasnippet
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

(provide 'init-yasnippet)
