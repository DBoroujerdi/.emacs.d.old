
(defun add-mode-to-list (mode)
  (add-to-list 'auto-mode-alist '("\\.el\\". mode)))

(defun elisp-modes (mode-list)
  (dolist (m mode-list)
    (add-mode-to-list m)))

(elisp-modes
 '(
   rainbow-delimiters-mode
   show-paren-mode
   ))
