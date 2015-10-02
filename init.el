
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

(global-auto-revert-mode t)

;; ===== Shell =====

;; load bin files onto patch
(add-to-list 'load-path "~/bin")

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; Save here instead of littering current directory with emacs backup files
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))


;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

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
(require 'theme)
(require 'init-ido)
(require 'init-elisp)
(require 'init-markdown)
(require 'init-ess)
;;(require 'init-helm)
(require 'init-erlang)
