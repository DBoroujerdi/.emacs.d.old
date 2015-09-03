
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

;; A function to load config files
;; setting up the configs dir
(setq emacs-config-dir (file-name-directory
                        (or (buffer-file-name) load-file-name)))

(defconst *emacs-config-dir* (concat emacs-config-dir "/configs/" ""))

(defun load-config-files (files)
  (dolist (f files)
    (load (expand-file-name
           (concat *emacs-config-dir* f)))
    (message "Loaded config file: %s" file)))

(load-config-files 
 '("functions"
   "keys"
   "init-helm"
   "init-irc"
   ;;"init-company"
   "init-markdown"
   "init-osx"
   "init-erlang"
   ;;    "init-go"
   "init-elisp"
   ;;   "init-puppet"
   ;;   "init-scala"
   "init-ess"
   ))
