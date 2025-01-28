(defvar msr/directives '((default . "You are a large language model living in Emacs and a helpful assistant. Respond concisely.")
                      (programming . "You are a large language model and a careful programmer. Provide code and only code as output without any additional text, prompt or note.")
                      (writing . "You are a large language model and a writing assistant. Respond concisely.")
                      (chat . "You are a large language model and a conversation partner. Respond concisely.")
                      (zettelkast .
                        "Review the provided Zettelkasten atomic note by evaluating the following criteria:

1. **Minimalism:** Is the note concise and free of unnecessary details? Does it focus solely on the essential information without redundancy?

2. **Language and Style:** Is the note written in simple, clear language? Are the sentences brief and easy to understand? Avoids complex words or jargon.

3. **Atomic Idea:** Does the note revolve around a single, well-defined concept? Is the idea presented cohesively without branching into unrelated topics?

4. **Structure:** Does the first sentence provide a clear, high-level overview of the note? Is the first paragraph effective in summarizing the main idea? Are subsequent paragraphs logical in expanding the topic?

By focusing on these elements, assess whether the note adheres to the principles of an effective Zettelkasten atomic note.")))

(use-package gptel
  :after evil
  :config
  (evil-global-set-key 'normal (kbd "ga") 'gptel-add)
  (evil-global-set-key 'visual (kbd "ga") 'gptel-add)
  (evil-global-set-key 'normal (kbd "gs") 'gptel-menu)
  (evil-global-set-key 'visual (kbd "gw") 'gptel-rewrite-menu)
  (setq gptel-directives msr/directives)
  (setq gptel-backend (gptel-make-ollama "Ollama"
                       :host "localhost:11434"
                       :stream t
                        :models '( llama3.2:latest
                                   deepseek-r1 )))
  ;; Probably too old version of the plugin?
  ;; (gptel-make-perplexity "Perplexity"
  ;;   :stream t
  ;;   ; For some reason the automatic detection didn't work
  ;;   ; The authentication info is stored in one of ~/.authinfo or ~/.authinfo.gpg
  ;;   :key (auth-source-pick-first-password :host "api.perplexity.ai")
  ;;   :models '( sonar sonar-pro ))
  (gptel-make-openai "OpenRouter"
    :host "openrouter.ai"
    :endpoint "/api/v1/chat/completions"
    :stream t
    ; For some reason the automatic detection didn't work
    ; The authentication info is stored in one of ~/.authinfo or ~/.authinfo.gpg
    :key (auth-source-pick-first-password :host "openrouter.ai")
    :models '( openai/gpt-4o-mini
               anthropic/claude-3.5-sonnet
               deepseek/deepseek-chat
               deepseek/deepseek-r1-distill-llama-70b
               ;; Poor substitute for the proper perplexity api
               ;; as this doesn't provide the sources
               ;;
               ;; And .. I have the automatic recurring 5$ for perplexity through membership
               ;; while the openrouter version is expensive. Probably the most expensive I have here
               perplexity/llama-3.1-sonar-large-128k-online)))
