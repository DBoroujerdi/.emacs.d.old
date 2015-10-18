
(setenv "PATH" (concat "/usr/local/bin/sbt/bin:" (getenv "PATH")))
(setenv "PATH" (concat "~/.svm/rt/bin:" (getenv "PATH")))

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)


;; OPTIONAL
;; there are some great Scala yasnippets, browse through:
;; https://github.com/AndreaCrotti/yasnippet-snippets/tree/master/scala-mode
(add-hook 'scala-mode-hook #'yas-minor-mode)
;; but company-mode / yasnippet conflict. Disable TAB in company-mode with
(define-key company-active-map [tab] nil)

(provide 'init-scala)
