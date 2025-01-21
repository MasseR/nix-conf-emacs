(use-package neotree
  :after evil evil-leader projectile
  :config
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (setq neo-smart-open t)
  (evil-leader/set-key
    "ft" 'neotree-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "ma") 'neotree-create-node)
  (evil-define-key 'normal neotree-mode-map (kbd "md") 'neotree-delete-node)
  (evil-define-key 'normal neotree-mode-map (kbd "mm") 'neotree-rename-node)
  )
