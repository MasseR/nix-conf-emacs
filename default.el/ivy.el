(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        enable-recursive-minibuffers t
        ivy-use-selectable-prompt t)
  )
(use-package counsel)
(use-package prescient
  :config
  (prescient-persist-mode 1)
  (setq prescient-filter-method '(literal regexp initialism fuzzy)))
(use-package ivy-prescient
  :after (counsel prescient)
  :config
  (ivy-prescient-mode 1)
  (setq ivy-prescient-retain-classic-highlighting t))
