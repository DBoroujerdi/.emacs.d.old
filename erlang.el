

(defvar erlang_home
  (if (eq system-type 'darwin)
      "/opt/local/lib/erlang/"
      "/usr/lib64/erlang/"))

(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs/.cask/24.4.1/elpa/auto-complete-20150201.150/dict/")
(ac-config-default)

(setq load-path (cons (concat erlang_home "lib/tools-2.7.1/emacs")
		      load-path))
(setq erlang-root-dir "/usr/lib64/erlang/")
(setq exec-path (cons (concat erlang_home "bin") exec-path))
(require 'erlang-start)

(add-hook 'erlang-mode-hook '(lambda() (setq indent-tabs-mode nil)))

(require 'erlang-flymake)

(add-to-list 'ac-modes 'erlang-mode)



