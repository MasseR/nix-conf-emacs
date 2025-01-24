; https://www.masteringemacs.org/article/how-to-get-started-tree-sitter
; Define the known grammars

(setq treesit-language-source-alist
  '( (bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (vim "https://github.com/neovim/tree-sitter-vim")
     (clojure "https://github.com/sogaiu/tree-sitter-clojure")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (nix "https://github.com/nix-community/tree-sitter-nix")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (haskell "https://github.com/tree-sitter/tree-sitter-haskell")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (mermaid "https://github.com/monaqa/tree-sitter-mermaid")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;; We need both the grammar and the revised major mode
;; Note that not all grammars have a revised major mode

(setq major-mode-remap-alist
  '( (yaml-mode . yaml-ts-mode)
     (bash-mode . bash-ts-mode)
     (js2-mode . js-ts-mode)
     (typescript-mode . typescript-ts-mode)
     (json-mode . json-ts-mode)
     (css-mode . css-ts-mode)
     (python-mode . python-ts-mode)
     (haskell-mode . haskell-ts-mode)
     (clojure-mode . clojure-ts-mode)
     (nix-mode . nix-ts-mode)
     (markdown-mode . markdown-ts-mode)
     (vimscript-mode . vimscript-ts-mode)))
