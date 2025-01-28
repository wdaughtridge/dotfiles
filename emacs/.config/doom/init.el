;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       company             ; the ultimate code completion backend
       (corfu +orderless)  ; complete with cap(f), cape and a flying feather!
       vertico             ; the search engine of the future

       :ui
       doom                ; what makes DOOM look the way it does
       doom-dashboard      ; a nifty splash screen for Emacs
       doom-quit           ; DOOM quit-message prompts when you quit Emacs
       hl-todo             ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       indent-guides       ; highlighted indent columns
       modeline            ; snazzy, Atom-inspired modeline, plus API
       nav-flash           ; blink cursor line after big motions
       ophints             ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       (vc-gutter +pretty) ; vcs diff in the fringe
       vi-tilde-fringe     ; fringe tildes to mark beyond EOB
       workspaces          ; tab emulation, persistence & separate workspaces

       :editor
       file-templates      ; auto-snippets for empty files
       fold                ; (nigh) universal code folding
       multiple-cursors    ; editing in many places at once
       snippets            ; my elves. They type so I don't have to

       :emacs
       dired               ; making dired pretty [functional]
       electric            ; smarter, keyword-based electric-indent
       undo                ; persistent, smarter undo for your inevitable mistakes
       vc                  ; version-control and Emacs, sitting in a tree

       :term
       eshell              ; the elisp shell that works everywhere
       vterm               ; the best terminal emulation in Emacs

       :checkers
       syntax              ; tasing you for every semicolon you forget

       :tools
       lookup              ; navigate your code and its documentation
       lsp                 ; M-x vscode
       magit               ; a git porcelain for Emacs
       make                ; run make tasks from Emacs
       terraform           ; infrastructure as code
       tree-sitter         ; syntax and parsing, sitting in a tree...

       :os
       (:if (featurep :system 'macos) macos)
       tty

       :lang
       (cc +tree-sitter)         ; C > C++ == 1
       (csharp +tree-sitter)     ; unity, .NET, and mono shenanigans
       (elixir +tree-sitter)     ; erlang done right
       (emacs-lisp +tree-sitter) ; drown in parentheses
       (erlang +tree-sitter)     ; an elegant language for a more civilized age
       (go +lsp +tree-sitter)    ; the hipster dialect
       (json +tree-sitter)       ; At least it ain't XML
       (java +tree-sitter)       ; the poster child for carpal tunnel syndrome
       markdown                  ; writing docs for people to ignore
       org                       ; organize your plain life in plain text
       (python +tree-sitter)     ; beautiful is better than ugly
       (rust +lsp +tree-sitter)  ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       sh                        ; she sells {ba,z,fi}sh shells on the C xor
       (yaml +tree-sitter)       ; JSON, but readable

       :config
       ;;literate
       (default +bindings +smartparens))
