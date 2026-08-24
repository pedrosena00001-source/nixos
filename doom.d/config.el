```elisp
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Nome
(setq user-full-name "azazel")

;; Fonte
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 13))

;; Tema
(setq doom-theme 'doom-one)

;; Números de linha
(setq display-line-numbers-type 'relative)

;; LSP
(after! lsp-mode
  (setq lsp-enable-file-watchers nil))

;;KeyBindings
(map! :leader
      "f f" #'find-file
      "f x" #'vterm)
```
      
