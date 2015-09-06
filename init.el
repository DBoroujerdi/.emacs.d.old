
;; ===== Package Archives ======

(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; should update Cask file after new packages are installed manually
(require 'pallet)
(pallet-mode t)

(require 'package)
(add-to-list 'package-archives
             '("melpa"      . "http://melpa.milkbox.net/packages/") t)

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))


;; ===== Shell =====

;; load bin files onto patch
(add-to-list 'load-path "~/bin")

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; Save here instead of littering current directory with emacs backup files
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))



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

(set-default-font "monaco 10")

;; window size
(setq initial-frame-alist '((top . 0) (left . 0) (width . 200) (height . 50)))

;; (require 'dirtree)

;; inserts newline on C-n when on last line in the buffer
(setq next-line-add-newlines t)

;; automatically make sh scripts executable on save
(add-hook 'after-save-hook
	  'executable-make-buffer-file-executable-if-script-p)

;; (sml/setup)

;; (autoload 'bash-completion-dynamic-complete 
;;   "bash-completion"
;;   "BASH completion hook")
;; (add-hook 'shell-dynamic-complete-functions
;;   'bash-completion-dynamic-complete)


;; ========= Load other config files =========


(defvar current-user
      (getenv
       (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(message "Running as user %s .." current-user)

(defvar root-dir "~/.emacs.d/")

(defvar modules-dir (expand-file-name  "modules/" root-dir)
  "This directory houses all of the user  modules.")

(message "Added %s to load-path" modules-dir)

(add-to-list 'load-path modules-dir)

(require 'functions)
(require 'keys)
(require 'init-elisp)
(require 'init-markdown)
(require 'init-ess)
(require 'init-helm)
(require 'init-erlang)
