(use-package ledger-mode
  :mode "\\.journal\\'"
  :config
  (setq
   ledger-binary-path "hledger"
   ledger-report-links-in-register nil
   ledger-mode-should-check-version nil
   )
  )
