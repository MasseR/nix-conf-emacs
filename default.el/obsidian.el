(use-package obsidian
  :config
  (obsidian-specify-path "~/zettel/")
  (global-obsidian-mode t)
  :custom
  (obsidian-inbox-directory "Inbox")
  (obsidian-daily-notes-directory "periodic")
  :bind (:map obsidian-mode-map
              ("C-c C-o" . obsidian-follow-link-at-point)
              ("C-c C-b" . obsidian-backlink-jump)
              ("C-c C-l" . obsidian-insert-wikilink)))
