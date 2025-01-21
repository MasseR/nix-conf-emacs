(use-package clojure-ts-mode
  :config
  (add-hook 'clojure-ts-mode-hook #'cider-mode)
  (add-hook 'clojure-ts-mode-hook #'enable-paredit-mode)
  (add-hook 'clojure-ts-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'clojure-ts-mode-hook #'clj-refactor-mode))
