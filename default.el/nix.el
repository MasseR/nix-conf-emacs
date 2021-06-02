(use-package nix-mode
  :mode ("\\.nix\\'" "\\.nix.in\\'")
  :config
  (evil-leader/set-key-for-mode 'nix-mode
    "a" 'eglot-code-action-quickfix)
  )
