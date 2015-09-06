
(defvar erlang_home "/home/dborouje/apps/erlang/")

(add-to-list
 'load-path
 (car
  (file-expand-wildcards
   "/home/dborouje/apps/erlang/lib/tools-*/emacs/")))

(setq erlang-root-dir erlang_home)
(setq exec-path (cons (concat erlang_home "bin") exec-path))
(require 'erlang-start)

(add-hook 'erlang-mode-hook '(lambda() (setq indent-tabs-mode nil)))

(require 'erlang-flymake)

(provide 'init-erlang)
