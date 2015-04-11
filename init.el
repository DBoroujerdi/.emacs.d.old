
;; ===== Package Archives ======

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'package)
(add-to-list 'package-archives
             '("melpa"      . "http://melpa.milkbox.net/packages/") t)

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; ===== Automatically load abbreviations table =====

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it

(setq initial-frame-alist '((top . 0) (left . 0) (width . 200) (height . 50)))

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

(when (display-graphic-p)
  (scroll-bar-mode 0)) 
  
(tool-bar-mode 0)
(menu-bar-mode 0)

(set-default-font "monaco 12")


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

(load "~/.emacs.d/erlang.el")
(load "~/.emacs.d/go.el")
;; (load "~/.emacs.d/puppet.el")
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

(defun shell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (shell "new")
    (rename-buffer (concat "*shell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(global-set-key (kbd "C-!") 'shell-here)


;; match parenthesis

(global-set-key "%" 'match-paren)
          
          (defun match-paren (arg)
            "Go to the matching paren if on a paren; otherwise insert %."
            (interactive "p")
            (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
                  ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
                  (t (self-insert-command (or arg 1)))))



;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; company mode in all buffers
(add-hook 'after-init-hook 'global-company-mode)

;; only for OSX - loads path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)
