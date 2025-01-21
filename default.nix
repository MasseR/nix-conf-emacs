{ emacs, callPackage, runCommand, writeText, sqlite }:

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
  # org-roam-ui

  ivy
  counsel


  obsidian

  xclip


  # treesitter requires not only the grammar but specific major modes
  haskell-ts-mode
  nix-ts-mode
  markdown-ts-mode
  clojure-ts-mode
])
