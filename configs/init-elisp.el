
(defun add-mode-to-list (mode)
  (add-to-list 'auto-mode-alist '("\\.el\\'" . (lambda ()
						 (emacs-lisp-mode)
						 (rainbow-delimiters-mode)
						 (show-paren-mode)
						 ))))
