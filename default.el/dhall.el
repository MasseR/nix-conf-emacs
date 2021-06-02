(use-package dhall-mode
  :after eglot
  :config
  (sp-local-pair 'dhall-mode "\\(" ")")
  (sp-local-pair 'dhall-mode "''" "''")
  (add-to-list 'eglot-server-programs '(dhall-mode . ("dhall-lsp-server")))
  (evil-leader/set-key-for-mode 'dhall-mode
    ; No code actions for dhall :(
    ;; "a" 'lsp-execute-code-action
    "dd" 'flycheck-list-errors
    )
  )
