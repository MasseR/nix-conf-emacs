(use-package dhall-mode
  :after eglot
  :config
  (my/leader :keymaps 'dhall-mode-map
    ; No code actions for dhall :(
    ;; "a" 'lsp-execute-code-action
    "dd" 'flycheck-list-errors
    )
  )
