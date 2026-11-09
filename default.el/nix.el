(use-package nix-mode
  :mode ("\\.nix\\'" "\\.nix.in\\'")
  :config
  (my/leader :keymaps 'nix-mode-map
    "a" 'eglot-code-action-quickfix)
  )
