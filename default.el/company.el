(use-package company
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0) ;; default is 0.2
  (global-company-mode 1)
  )
