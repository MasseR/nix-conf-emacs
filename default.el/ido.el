(use-package ido
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (ido-vertical-mode 1)
  (setq ido-enable-flex-matching t
        ido-everywhere t
        ido-vertical-define-keys 'C-n-C-p-up-and-down))

(use-package flx-ido
  :config
  (flx-ido-mode 1)
  (setq ido-enable-flex-matching t
        ido-use-faces nil))

(use-package ido-completing-read+
  :after ido
  :config
  (ido-ubiquitous-mode 1))
