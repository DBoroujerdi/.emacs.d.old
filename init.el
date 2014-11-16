
;; ===== Package Archives ======

(require 'package)
(add-to-list 'package-archives
             '("melpa"      . "http://melpa.milkbox.net/packages/") t)

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; ===== Automatically load abbreviations table =====

;; default packages
(defvar my-packages '(auto-complete
                      puppet-mode
		      flymake-puppet
		      yaml-mode
		      twittering-mode
		      circe
		      go-eldoc
		      magit
		      dirtree
		      company
		      company-go
		      )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it

(setq initial-frame-alist '((top . 0) (left . 0) (width . 200) (height . 200)))

;; load bin files onto patch
(add-to-list 'load-path "~/bin")

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; Save here instead of littering current directory with emacs backup files
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))


;; ========== Look & Feel =========

;; Disable toolbar
(tool-bar-mode -1)

(blink-cursor-mode 0)

(scroll-bar-mode 0)

(tool-bar-mode 0)
(menu-bar-mode 0)

(set-default-font "monaco 10")


;; ========= Required Packages =========
 
;; ido mode
(require 'ido)
    (ido-mode t)

(require 'twittering-mode)

;; ============ Key Bindings ===========

(global-set-key (kbd "C-x c") 'comment-region)
(global-set-key (kbd "C-x x") 'uncomment-region)

;; window tabbing
(global-set-key [C-tab] 'other-window)
(global-set-key [C-S-iso-lefttab] 'previous-multiframe-window)

;; Formatting XML
(defun xml-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "xmllint --format -" (buffer-name) t)
  )
)

;; IRC - https://github.com/jorgenschaefer/circe/wiki
(add-to-list 'load-path "~/.emacs.d/vendor/circe/lisp")
(require 'circe)

;; company mode for autocompletion
(add-to-list 'load-path "~/.emacs.d/vendor/company-mode/")
(require 'company)


;; ========= External .el files =========

(load "~/.emacs.d/go.el")
(load "~/.emacs.d/puppet.el")
;; (load "~/.emacs.d/scala.el")

;; ===== markdown

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(require 'dirtree)

;; inserts newline on C-n when on last line in the buffer
(setq next-line-add-newlines t)

;; automatically make sh scripts executable on save
(add-hook 'after-save-hook
  'executable-make-buffer-file-executable-if-script-p)
