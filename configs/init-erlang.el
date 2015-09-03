

(defvar erlang_home "/home/dborouje/apps/erlang_17_5/")

(defvar tools_dir "lib/tools-2.7.2/emacs")

(setq erlang-root-dir "/home/dborouje/apps/erlang_17_5/")

(require 'auto-complete-config)

;; TODO need to fix this hard coding
(add-to-list 'ac-dictionary-directories "~/.emacs.d/.cask/24.5.1/elpa/auto-complete-20150408.1132/dict/")
(ac-config-default)

(setq load-path (cons (concat erlang_home tools_dir)
		      load-path))
(setq erlang-root-dir erlang_home)
(setq exec-path (cons (concat erlang_home "bin") exec-path))
(require 'erlang-start)

(add-hook 'erlang-mode-hook '(lambda() (setq indent-tabs-mode nil)))

(require 'erlang-flymake)

(add-to-list 'ac-modes 'erlang-mode)
