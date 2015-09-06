
(defvar erlang_home "/home/dborouje/apps/erlang/")

(setq load-path (cons "/home/dborouje/apps/erlang/lib/tools-*/emacs/" load-path))

(setq erlang-root-dir erlang_home)
(setq exec-path (cons (concat erlang_home "bin") exec-path))

(require 'erlang-start)

(add-hook 'erlang-mode-hook '(lambda() (setq indent-tabs-mode nil)))

(require 'erlang-flymake)

(provide 'init-erlang)
