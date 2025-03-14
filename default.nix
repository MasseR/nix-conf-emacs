{ emacs, callPackage }:

let
  default-el = callPackage ./default.el {};

in

# ((emacsPackagesGen emacs).overrideScope' overrides).emacsWithPackages ( epkgs: with epkgs; [
emacs.pkgs.withPackages ( epkgs: with epkgs; [
  default-el

  # eglot

  evil
  evil-leader
  evil-numbers
  evil-surround
  evil-commentary
  evil-collection
  evil-org

  todotxt

  helm

  zenburn-theme

  markdown-mode
  yaml-mode

  rainbow-delimiters
  smartparens

  lsp-mode
  lsp-ui
  lsp-treemacs
  avy

  flycheck

  company

  transient

  nix-mode
  haskell-mode
  dhall-mode

  lsp-haskell

  which-key

  neotree
  projectile

  diff-hl
  magit

  # ido-vertical-mode
  # flx-ido
  # epkgs."ido-completing-read+"

  editorconfig

  use-package

  direnv

  undo-tree

  ledger-mode

  notmuch

  org-roam
  org-download

  # See comments on org-roam.el
  org-roam-ui

  # The ts-mode is quite barebones
  # and the grammar support is limited
  mermaid-mode
  ob-mermaid # org-mode exports from source blocks

  d2-mode
  ob-d2 # org-mode exports from source blocks

  ivy
  counsel


  obsidian

  xclip

  cider


  gptel

  # treesitter requires not only the grammar but specific major modes
  haskell-ts-mode
  nix-ts-mode
  markdown-ts-mode
  clojure-ts-mode
  vimscript-ts-mode
])
