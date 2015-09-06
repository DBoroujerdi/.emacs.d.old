
(ido-mode 1)
(ido-everywhere 1)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                                        ; when Smex is auto-initialized on its first run.


(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(provide 'init-ido)
