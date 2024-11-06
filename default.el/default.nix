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
  ivy = builtins.readFile ./ivy.el;
  org = builtins.readFile ./org.el;
  # eglot = builtins.readFile ./eglot.el;
  lsp-mode = builtins.readFile ./lsp.el;
  ledger = builtins.readFile ./ledger.el;
  whitespace = builtins.readFile ./whitespace.el;
  general = builtins.readFile ./general.el;
  epa = builtins.readFile ./emacs_epa.el;
  todotxt = builtins.readFile ./todotxt.el;
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

(setq-default frame-title-format '("%f [" mode-name "]"))

; Prevent any installation from package archives
(setq package-archives nil)

(eval-when-compile (require 'use-package))
(setq use-package-always-ensure nil
      use-package-ensure-function 'ignore
      package-enable-at-startup nil
      package--init-file-ensured t
  )

(use-package undo-tree
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history nil) )
(use-package rainbow-delimiters)
(use-package smartparens
  :config (smartparens-global-mode)
  )
(use-package smartparens-config
  :after smartparens
  )
${general}
${ivy}
${org}
${evil}
${lsp-mode}
${neotree}
${helm}
${projectile}
${dhall}
${haskell}
${nix}
${ledger}
${company}
${whitespace}
${epa}
${todotxt}



(use-package yaml-mode)
(use-package direnv
  :config (direnv-mode))
(use-package editorconfig
  :config (editorconfig-mode 1)
  )
(use-package magit)
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

