
;; allow ? help command where available
(global-discover-mode 1)

;; js indent level to 4 spaces
(setq js-indent-level 4)

;; no tabs allowed
(setq-default indent-tabs-mode nil)

;; enable command log - logs commands!
(require 'command-log-mode)

(provide 'init-misc)
