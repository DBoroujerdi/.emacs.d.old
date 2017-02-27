;;; package --- Summary
;;; Commentary:
;; http://ess.r-project.org/Manual/ess.html#Step-by-step-instructions

;; M-x R RET -- Start R process or start another
;; C-c C-l   -- Load the current source file via source() into R process


;;; Code:

(use-package ess-site
  :mode "\\.r\\'"
  :config
  (progn
    (require 'ess-site)
    ))


(provide 'init-ess)
;;; init-ess.el ends here
