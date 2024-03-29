(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3c3836" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(custom-safe-themes
   (quote
    ("3f5701c23d328be03536349b29cb24c5cfa79ea9ef9c46cf89668eda16b88a9c" "ac2b1fed9c0f0190045359327e963ddad250e131fbf332e80d371b2e1dbc1dc4" default)))
 '(edts-man-root "/home/dborouje/.emacs.d/edts/doc/17.5")
 '(markdown-command "/usr/bin/pandoc" t)
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "imap.gmail.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; disable annoying ssh warning
(setq exec-path-from-shell-check-startup-files nil)

(setq c-default-style "linux" c-basic-offset 8)


(defvar emacs-d
  (file-name-directory
   (file-chase-links load-file-name)))

;; ===== Package Archives ======

(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; should update Cask file after new packages are installed manually
(require 'pallet)
(pallet-mode t)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; sets $MANPATH, $PATH and exec-path from your shell, but only on OS X.
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(add-to-list 'exec-path "/usr/local/bin/")

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

;; suppress 'ad-handle-definition: ‘ido-completing-read’ got redefined' warning
(setq ad-redefinition-action 'accept)

(setq c-default-style "linux" c-basic-offset 8)

;; ========= Load other config files =========


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)


(defun current-user ()
  (getenv
   (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(message "Running as user %s .." (current-user))

(defvar modules-dir (expand-file-name  "modules/" emacs-d)
  "This directory houses all of the user  modules.")

(message "Added %s to load-path" modules-dir)

(add-to-list 'load-path modules-dir)

(require 'functions)
(require 'keys)
(require 'init-theme)
(require 'init-packages)
(require 'init-misc)
(require 'init-ido)
;; (require 'init-js)
(if (eq system-type 'darwin)
    (require 'init-osx))
