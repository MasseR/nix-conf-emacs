(use-package dhall-mode
  :after eglot smartparens
  :config
  (sp-local-pair 'dhall-mode "\\(" ")")
  (sp-local-pair 'dhall-mode "''" "''")
  (evil-leader/set-key-for-mode 'dhall-mode
    ; No code actions for dhall :(
    ;; "a" 'lsp-execute-code-action
    "dd" 'flycheck-list-errors
    )
  )
