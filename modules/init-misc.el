

(use-package popup-imenu
  :commands popup-imenu
  :bind ("M-i" . popup-imenu))


;; allow ? help command where available
;; (global-discover-mode 1)

;; no tabs allowed
(setq-default indent-tabs-mode nil)

;; enable command log - logs commands!
(require 'command-log-mode)

;; ediff config..
;; makes ediff operate in the selected frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; makes ediff horizontally split
(setq ediff-split-window-function 'split-window-horizontally)
;; TODO more ediff config to add.. http://emacswiki.org/emacs/EdiffMode


;; gnus
(setq user-mail-address	"daniel.boroujerdi@gmail.com"
      user-full-name	"Daniel Boroujerdi")
(setq gnus-select-method '(nntp "news.gwene.org"))

;; elfeed
(setq elfeed-feeds
      '(
        ("http://blog.erlware.org/rss/" erlang)
        ("http://nedroid.com/feed/" webcomic)
        ("http://feed.codeofrob.com/RobAshton" erlang)
        ("http://news.ycombinator.com/rss" general)
        ("http://feeds.feedburner.com/codinghorror" general)
        ("http://martinfowler.com/bliki/bliki.atom" general)
        ("http://www.bbc.co.uk/blogs/adamcurtis/atom.xml" culture)
        ))

;; elfeed goodies
(require 'elfeed-goodies)
(elfeed-goodies/setup)

;; typed text replaces selected
(delete-selection-mode 1)


;; display git status on buffer edge
(global-git-gutter-mode +1)

(custom-set-variables
 '(markdown-command "/usr/bin/pandoc"))

;; disable flyspell
(flyspell-mode 0)

;; docker everywhere
(use-package docker-mode
  :disabled
  :config
  (progn
    (docker-global-mode 1))
  )


;; display key binding following incomplete command
(which-key-mode)
(which-key-setup-side-window-right)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)


(defalias 'yes-or-no-p 'y-or-n-p)

;; turn off truncate lines by default
(setq-default truncate-lines f)

(provide 'init-misc)
