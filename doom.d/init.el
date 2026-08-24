;;; $DOOMDIR/init.el -*- lexical-binding: t; -*-

(doom!
 :completion
 company
 vertico

 :ui
 doom
 dashboard
 modeline

 :editor
 evil

 :tools
 lsp

 :term
 vterm

 :lang
 emacs-lisp
 (nix +lsp))
