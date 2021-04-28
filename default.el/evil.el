(use-package evil
	     :init (setq evil-want-integration t
			 evil-want-keybinding nil
			 evil-want-C-u-scroll t
			 )
	     :config
	     (evil-mode t)
	     (evil-leader/set-key
	       "gs" 'magit-status
	       "lb" 'helm-buffers-list
	       "lf" 'projectile-find-file
	       "ft" 'neotree
	       "ps" 'projectile-switch-project
	       "ss" 'projectile-switch-project
	       "cc" 'org-capture
	       )
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
(use-package evil-org
	     :after evil
	     :config
	     (evil-org-mode t)
	     )
(use-package evil-org-agenda
	     :after evil
	     :config (evil-org-agenda-set-keys))
(use-package evil-collection
	     :after evil
	     :config (evil-collection-init)
	     )
