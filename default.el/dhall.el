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
  :after lsp-mode
  :config
  (setup-dhall-lsp)
  )
