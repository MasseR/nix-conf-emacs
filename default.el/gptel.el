(use-package gptel
  :config
  (gptel-make-ollama "Ollama"
                       :host "localhost:11434"
                       :stream t
                       :models '(llama3.2:latest)))
