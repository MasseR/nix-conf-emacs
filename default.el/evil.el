(use-package evil
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil
        evil-want-C-u-scroll t
        )
  :config
  (evil-mode t)
  (evil-leader/set-key
    "gs" 'magit-status
    "mb" 'helm-buffers-list ; List all buffers
    "lb" 'projectile-switch-to-buffer ; List project local buffers
    "lf" 'projectile-find-file
    "ps" 'projectile-switch-project
    "ss" 'projectile-switch-project
    "]]" 'sp-forward-slurp-sexp
    "[[" 'sp-forward-barf-sexp
    "ff" 'counsel-rg
    )
  (evil-set-undo-system 'undo-tree)
  (add-hook 'evil-local-mode-hook 'turn-on-undo-tree-mode)
  )
(use-package evil-leader
  :after evil
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>"))
(use-package evil-surround
  :after evil
  :config (global-evil-surround-mode))
(use-package evil-commentary
  :after evil
  :config (evil-commentary-mode 1))
;; https://githubmemory.com/repo/Somelauw/evil-org-mode/issues/93
(fset 'evil-redirect-digit-argument 'ignore)
(use-package evil-org
  :after org evil
  :config
  ;; (add-to-list 'evil-digit-bound-motions 'evil-org-beginning-of-line)
  (evil-define-key 'motion 'evil-org-mode
    (kbd "0") 'evil-org-beginning-of-line)
  (add-hook 'org-mode-hook 'evil-org-mode)
  )
(use-package evil-org-agenda
  :after evil
  :config (evil-org-agenda-set-keys))
(use-package evil-collection
  :after evil
  :config (evil-collection-init)
  )
