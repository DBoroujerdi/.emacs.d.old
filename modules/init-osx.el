;; Allow hash to be entered
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))


;; only for OSX - loads path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq ispell-program-name "/usr/local/bin/ispell")

(provide 'init-osx)
