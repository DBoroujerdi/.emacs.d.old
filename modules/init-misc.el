
;; allow ? help command where available
(global-discover-mode 1)

;; js indent level to 4 spaces
(setq js-indent-level 4)

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
        "http://www.manolosandtinytoes.com/feed"
        "http://blog.erlware.org/rss/"
        "http://nullprogram.com/feed/"
        ))

;; typed text replaces selected
(delete-selection-mode 1)

(provide 'init-misc)
