{ emacsWithPackages, callPackage, runCommand, writeText }:

let
  default-el = callPackage ./default.el {};

in

emacsWithPackages ( epkgs: with epkgs; [
  default-el

  evil
  evil-leader
  evil-numbers
  evil-surround
  evil-commentary
  evil-collection
  evil-org
helm

  zenburn-theme

  markdown-mode

  rainbow-delimiters
  smartparens

  lsp-mode
  lsp-ui

  flycheck

  company

  transient

  nix-mode
  haskell-mode
  lsp-haskell
  dhall-mode

  which-key

  neotree
  projectile

  diff-hl
  magit

  ido-vertical-mode

  editorconfig

  use-package

  direnv

  undo-tree
])
