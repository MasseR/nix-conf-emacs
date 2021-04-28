(use-package lsp-mode)
(use-package lsp-ui)

;; Haskell configuration
(use-package lsp-haskell
	     :after lsp-mode
	     :config
	     (add-hook 'haskell-mode-hook #'lsp)
	     (add-hook 'haskell-literate-mode-hook #'lsp)
	     )
