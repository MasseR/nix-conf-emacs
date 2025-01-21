(use-package gptel
  :config
  (setq gptel-backend (gptel-make-ollama "Ollama"
                       :host "localhost:11434"
                       :stream t
                        :models '(llama3.2:latest)))
  (gptel-make-openai "OpenRouter"
    :host "openrouter.ai"
    :endpoint "/api/v1/chat/completions"
    :stream t
    ; For some reason the automatic detection didn't work
    ; The authentication info is stored in one of ~/.authinfo or ~/.authinfo.gpg
    :key (auth-source-pick-first-password :host "openrouter.ai")
    :models '(openai/gpt-4o-mini
               meta-llama/codellama-34b-instruct
               anthrophic/claude-3-5-sonnet)))
