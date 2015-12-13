
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

;; sets $MANPATH, $PATH and exec-path from your shell, but only on OS X.
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(defun load-init-theme (nothing)
  (load-file "~/.emacs.d/modules/init-theme.el"))

(add-hook 'after-make-frame-functions 'load-init-theme)


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


;;=============== Global Modes ===============

(docker-global-mode 1)


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
(require 'init-theme)
(require 'init-project)
(require 'init-misc)
(require 'init-elisp)
(require 'init-markdown)
(require 'init-ess)
(require 'init-erlang)
(require 'init-yasnippet)
;; (require 'init-scala)
(require 'init-ido)
(if (eq system-type 'darwin)
    (require 'init-osx))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ac2b1fed9c0f0190045359327e963ddad250e131fbf332e80d371b2e1dbc1dc4" default)))
 '(edts-man-root "/home/dborouje/.emacs.d/edts/doc/17.5")
 '(elfeed-feeds
   (quote
    ("http://inaka.net/blog/" "http://mostlyerlang.com/feed/" "http://www.theguardian.com/football/rss" "http://www.planeterlang.com/atom.xml"
     ("http://blog.erlware.org/rss/" erlang)
     ("http://nedroid.com/feed/" webcomic)
     ("http://feed.codeofrob.com/RobAshton" erlang)
     ("http://news.ycombinator.com/rss" general)
     ("http://feeds.feedburner.com/codinghorror" general)
     ("http://martinfowler.com/bliki/bliki.atom" general)
     ("http://www.bbc.co.uk/blogs/adamcurtis/atom.xml" culture))))
 '(markdown-command "/usr/bin/pandoc"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
