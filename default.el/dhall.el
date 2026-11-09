(use-package dhall-mode
  :after eglot smartparens
  :config
  (sp-local-pair 'dhall-mode "\\(" ")")
  (sp-local-pair 'dhall-mode "''" "''")
  (my/leader :keymaps 'dhall-mode-map
    ; No code actions for dhall :(
    ;; "a" 'lsp-execute-code-action
    "dd" 'flycheck-list-errors
    )
  )
