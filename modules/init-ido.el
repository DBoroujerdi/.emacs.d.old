
(ido-mode 1)
(ido-everywhere 1)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; smart command completion
(require 'smex)
(smex-initialize)

;; vertical ido completion
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; fuzzy ido matching
(setq ido-enable-flex-matching t)

;; start completion with word at cursor point
(setq ido-use-filename-at-point 'guess)

;; allow configuring of ignore extensions
(setq ido-ignore-extensions t)

(provide 'init-ido)
