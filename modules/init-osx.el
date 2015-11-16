;; Allow hash to be entered
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; Cmd as meta
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; only for OSX - loads path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq ispell-program-name "/usr/local/bin/ispell")

(provide 'init-osx)
