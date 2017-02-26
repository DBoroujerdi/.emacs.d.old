(use-package projectile
  :config
  ;; make projectile global
  (projectile-global-mode 1)

  ;; projectile should regenerate tags when idle
  (add-hook 'projectile-idle-timer-hook 'my-projectile-idle-timer-function)

  ;; automatically open top level folder in dired when
  ;; changing project
  (setq projectile-switch-project-action 'projectile-dired)

  ;; automatically change neo tree when changing projects
  ;; (setq projectile-switch-project-action 'neotree-projectile-action)
  )

(provide 'init-project)
