
(use-package ensime
  :ensure t
  :pin melpa-stable)

(add-to-list 'exec-path "/usr/local/bin/")

(use-package popup-imenu
  :commands popup-imenu
  :bind ("M-i" . popup-imenu))


;; Hungry / Contextual Backspace

(defun contextual-backspace ()
  "Hungry whitespace or delete word depending on context."
  (interactive)
  (if (looking-back "[[:space:]\n]\\{2,\\}" (- (point) 2))
      (while (looking-back "[[:space:]\n]" (- (point) 1))
        (delete-char -1))
    (cond
     ((and (boundp 'smartparens-strict-mode)
           smartparens-strict-mode)
      (sp-backward-kill-word 1))
     ((and (boundp 'subword-mode)
           subword-mode)
      (subword-backward-kill 1))
     (t
      (backward-kill-word 1)))))

(global-set-key (kbd "C-<backspace>") 'contextual-backspace)


;; jump over the boilerplate at the beginning of most files:

(scala-mode:goto-start-of-code)

(use-package highlight-symbol
  :diminish highlight-symbol-mode
  :commands highlight-symbol
  :bind ("C-h" . highlight-symbol))

(provide 'init-scala)
