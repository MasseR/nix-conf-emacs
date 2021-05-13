(defun setup-dhall-lsp ()
  (add-to-list 'lsp-language-id-configuration '(dhall-mode . "dhall"))
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection "dhall-lsp-server")
    :activation-fn (lsp-activate-on "dhall")
    :server-id 'dhall-lsp-server
    ))
  )
(use-package dhall-mode
  :after eglot smartparens
  :config
  (sp-local-pair 'dhall-mode "\\(" ")")
  (add-to-list 'eglot-server-programs '(dhall-mode . ("dhall-lsp-server")))
  (evil-leader/set-key-for-mode 'dhall-mode
    ; No code actions for dhall :(
    ;; "a" 'lsp-execute-code-action
    "dd" 'flycheck-list-errors
    )
  )
