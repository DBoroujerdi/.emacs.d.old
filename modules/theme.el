;; ========== Look & Feel =========

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; Disable toolbar
(tool-bar-mode -1)

;; solid cursor
(blink-cursor-mode 0)

;; no scroll bar
(when (display-graphic-p)
  (scroll-bar-mode 0))

;; no tool bar
(tool-bar-mode 0)

;; no menu bar
(menu-bar-mode 0)

;; no default start up screen
(setq inhibit-startup-screen t)

;; no initial scratch text
(setq initial-scratch-message)

;; set font
(set-frame-font "monofur 13" t t)

;; for new frames and emacs client..
(setq default-frame-alist '((font . "monofur 13")))

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


(provide 'theme)
