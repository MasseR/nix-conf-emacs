{ emacsPackagesGen, emacs, emacsWithPackages, callPackage, runCommand, writeText, sqlite }:

let
  default-el = callPackage ./default.el {};
  # I'm leaving the overrides here as a guide to the future
  overrides = self: super: rec {
    project = self.callPackage ({ elpaBuild, emacs, fetchurl, lib, xref }:
      elpaBuild {
        pname = "project";
        ename = "project";
        version = "0.6.0";
        src = fetchurl {
          url = "https://elpa.gnu.org/packages/project-0.6.0.tar";
          sha256 = "0m0r1xgz1ffx6mi2gjz1dkgrn89sh4y5ysi0gj6p1w05bf8p0lc0";
        };
        packageRequires = [ emacs xref ];
        meta = {
          homepage = "https://elpa.gnu.org/packages/project.html";
          license = lib.licenses.free;
        };
      }) {};
    xref = self.callPackage ({ elpaBuild, emacs, fetchurl, lib }:
      elpaBuild {
        pname = "xref";
        ename = "xref";
        version = "1.1.0";
        src = fetchurl {
          url = "https://elpa.gnu.org/packages/xref-1.1.0.tar";
          sha256 = "1s7pwk09bry4nqr4bc78a3mbwyrxagai2gpsd49x47czy2x7m3ax";
        };
        packageRequires = [ emacs ];
        meta = {
          homepage = "https://elpa.gnu.org/packages/xref.html";
          license = lib.licenses.free;
        };
      }) {};
  };

in

# ((emacsPackagesGen emacs).overrideScope' overrides).emacsWithPackages ( epkgs: with epkgs; [
emacsWithPackages ( epkgs: with epkgs; [
  default-el

  # eglot

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
  yaml-mode
  graphviz-dot-mode

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

  ido-vertical-mode
  flx-ido
  epkgs."ido-completing-read+"

  editorconfig

  use-package

  direnv

  undo-tree

  ledger-mode

  notmuch
])
