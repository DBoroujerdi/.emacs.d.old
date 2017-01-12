
;; https://github.com/skeeto/skewer-mode
;; http://emacs.stackexchange.com/questions/2376/how-to-use-skewer-mode

;; js indent level to 2 spaces
(setq js-indent-level 4)

;; js2 mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; jsx mode
(add-to-list 'auto-mode-alist '("\\.jsx$" . jsx-mode))

;; skewer mode
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

(require 'simple-httpd)
;; set root folder for httpd server
;; TODO externalise this into a function
(setq httpd-root "/Users/dboroujerdi/projects/Boids-js")

;; interactively modify html
(add-hook 'html-mode-hook 'skewer-html-mode)

(provide 'init-js)
