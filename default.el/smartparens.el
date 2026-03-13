(use-package smartparens
  :config
  (smartparens-global-mode)

  ;; Disable backtick pairing in markdown modes
  ;; Markdown uses backticks for code with uneven counts (` vs ```)
  (sp-local-pair 'markdown-mode "`" nil :actions nil)
  (sp-local-pair 'markdown-ts-mode "`" nil :actions nil)
  )

(use-package smartparens-config
  :after smartparens
  )
