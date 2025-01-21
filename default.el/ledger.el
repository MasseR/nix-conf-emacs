(use-package ledger-mode
  :mode "\\.journal\\'"
  :config
  (setq
   ledger-binary-path "hledger"
   ledger-report-links-in-register nil
   ledger-mode-should-check-version nil
   ledger-init-file-name " "
   ledger-highlight-xact-under-point nil
   )
  (add-hook 'ledger-mode-hook 'auto-revert-tail-mode)
  )
