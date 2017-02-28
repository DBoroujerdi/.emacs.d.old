;; ========== Look & Feel =========

;; Themes
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")


;;
;; WINDOW
;;

;; Disable toolbar
(tool-bar-mode -1)

;; solid cursor
(blink-cursor-mode 0)

;; disable scroll bar
(scroll-bar-mode -1)

;; no tool bar
(tool-bar-mode 0)

;; no menu bar
(menu-bar-mode 0)

;; no default start up screen
(setq inhibit-startup-screen t)

;; no initial scratch text
(setq initial-scratch-message nil)

;; buffer line spacing
(setq-default line-spacing 5)

;; window size
(setq initial-frame-alist '((top . 0) (left . 0) (width . 200) (height . 50)))
;; new window sizes
(setq default-frame-alist '((top . 0) (left . 0) (width . 200) (height . 50)))
;; width  -> num characters
;; height -> num lines



;;
;; FONT
;;

(set-frame-font "Inconsolata 13" t t)

;; for new frames and emacs client..
(setq default-frame-alist '((font . "Inconsolata 13")))

;; set font size
(set-face-attribute 'default nil :height 120)




;; (require 'dirtree)

;; (sml/setup)

;; (powerline-default-theme)

;; (add-hook 'after-init-hook #'fancy-battery-mode)

;; load additional custom themes to load path
;; additional themes that don't have elpa packages must
;; checked out in this folder
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-github-theme/")

(load-theme 'gruvbox t)

(provide 'init-theme)
