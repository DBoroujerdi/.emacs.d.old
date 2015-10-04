;; ========== Look & Feel =========

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; Disable toolbar
(tool-bar-mode -1)

(blink-cursor-mode 0)

(when (display-graphic-p)
  (scroll-bar-mode 0))

(tool-bar-mode 0)
(menu-bar-mode 0)
(set-default-font "monofur 13")

;; window size
(setq initial-frame-alist '((top . 0) (left . 0) (width . 200) (height . 50)))

;; (require 'dirtree)

;; inserts newline on C-n when on last line in the buffer
(setq next-line-add-newlines t)

;; automatically make sh scripts executable on save
(add-hook 'after-save-hook
	  'executable-make-buffer-file-executable-if-script-p)

;; (load-theme 'warm-night t)

;; (sml/setup)

;; (autoload 'bash-completion-dynamic-complete
;;   "bash-completion"
;;   "BASH completion hook")
;; (add-hook 'shell-dynamic-complete-functions
;;   'bash-completion-dynamic-complete)


(require 'golden-ratio)
(golden-ratio-mode 0)


(require 'column-marker)
(add-hook 'foo-mode-hook
          (lambda () (interactive) (column-marker-1 80)))


(provide 'theme)
