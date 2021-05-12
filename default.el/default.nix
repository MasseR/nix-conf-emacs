{ writeText, runCommand, sqlite, qutebrowser }:

let
  evil = builtins.readFile ./evil.el;
  dhall = builtins.readFile ./dhall.el;
  neotree = builtins.readFile ./neotree.el;
  helm = builtins.readFile ./helm.el;
  company = builtins.readFile ./company.el;
  projectile = builtins.readFile ./projectile.el;
  haskell = builtins.readFile ./haskell.el;
  nix = builtins.readFile ./nix.el;
  ido = builtins.readFile ./ido.el;
  org = builtins.readFile ./org.el;
  eglot = builtins.readFile ./eglot.el;
  org-roam = builtins.readFile ./org-roam.el;
  ledger = builtins.readFile ./ledger.el;
  general = builtins.readFile ./general.el;
  nix-environment = runCommand "nix-environment.el" {
    # Inherit or manually set the attrset here
    inherit sqlite qutebrowser;
  }
''
substituteAll ${./nix-environment.el.in} $out
'';
  generic = writeText "default.el"
''
; From https://git.sr.ht/~jack/nix-overlay/tree/master/item/jack-emacs/default.el/default.nix

(load "nix-environment")

(require 'package)

; Prevent any installation from package archives
(setq package-archives nil)

(eval-when-compile (require 'use-package))
(setq use-package-always-ensure nil
      use-package-ensure-function 'ignore
      package-enable-at-startup nil
      package--init-file-ensured t
  )
  
(use-package undo-tree
  :config (global-undo-tree-mode))
${general}
${org}
${org-roam}
${evil}  
${eglot}
${neotree}  
${helm}  
${projectile}  
${ido}
${dhall}
${haskell}
${nix}
${ledger}
${company}


(use-package direnv
  :config (direnv-mode))
(use-package editorconfig
  :config (editorconfig-mode 1)
  )
(use-package magit)
(use-package rainbow-delimiters)
(use-package smartparens
  :config (smartparens-global-mode)
  )
(use-package smartparens-config
  :after smartparens
  )
(use-package which-key
  :config (which-key-mode)
  )

'';

in

runCommand "default.el" {}
''
  mkdir -p $out/share/emacs/site-lisp
  cp ${nix-environment} $out/share/emacs/site-lisp/nix-environment.el
  cp ${generic} $out/share/emacs/site-lisp/default.el
''

