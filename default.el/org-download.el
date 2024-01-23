; https://github.com/abo-abo/org-download/issues/131
; The directory the files are downloaded are a bit weird. First, it
; requires an org-heading to exist, second it uses relative paths
; which don't get translated into proper paths in orgzly
(use-package org-download
  :after org
  :defer nil
  :custom
  (org-download-heading-lvl 0)
  (org-download-timestamp "org_%Y%m%d-%H%M%S_")
  (org-download-screenshot-method "xclip -selection clipboard -t image/png -o > '%s'")
  :bind
  ("C-M-y" . org-download-screenshot)
  :config
  (require 'org-download))
