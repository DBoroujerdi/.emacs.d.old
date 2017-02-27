
;; ============ Key Bindings ===========

(global-set-key (kbd "C-x c") 'comment-region)
(global-set-key (kbd "C-x x") 'uncomment-region)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)

;; window tabbing
(global-set-key [C-tab] 'other-window)
(global-set-key [C-S-iso-lefttab] 'previous-multiframe-window)

;; match parenthesis

;;;###autoload
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))


(global-set-key "%" 'match-paren)

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

(global-set-key (kbd "C-z") 'imenu)

(global-set-key (kbd "M-y") 'kill-ring-ido)

;; duplicate line
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")

(global-set-key (kbd "C-x z") 'toggle-windows-split)

;; meta arrow to move
(windmove-default-keybindings 'meta)

;; move buffer with Shift
(global-set-key (kbd "S-<left>")  'windmove-left)
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<up>")    'windmove-up)
(global-set-key (kbd "S-<down>")  'windmove-down)

;; another movement method
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; make a new frame
;; (global-set-key (kbd "M-n") 'make-frame)

;; magit shortcuts
(global-set-key (kbd "C-c s") 'magit-status)
(global-set-key (kbd "C-c l") 'magit-log)
(global-set-key (kbd "C-c c") 'magit-checkout)
(global-set-key (kbd "C-c b") 'magit-blame)


(global-set-key (kbd "M-/") 'hippie-expand)

;; unset a keybinding
;; (global-unset-key (kbd "C-x b"))


(provide 'keys)
