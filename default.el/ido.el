(use-package ido
	     :config
	     (ido-mode 1)
	     (ido-vertical-mode 1)
	     (setq ido-enable-flex-matching t
		   ido-everywhere t
		   ido-vertical-define-keys 'C-n-C-p-up-and-down))
