(doom! :completion
       (corfu +orderless)  ; complete with cap(f), cape and a flying feather!
       vertico             ; the search engine of the future

       :ui
       doom                ; what makes DOOM look the way it does
       doom-dashboard      ; a nifty splash screen for Emacs
       doom-quit           ; DOOM quit-message prompts when you quit Emacs
       hl-todo             ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       modeline            ; snazzy, Atom-inspired modeline, plus API
       ophints             ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       (vc-gutter +pretty) ; vcs diff in the fringe
       vi-tilde-fringe     ; fringe tildes to mark beyond EOB
       workspaces          ; tab emulation, persistence & separate workspaces

       :editor
       (evil +everywhere)  ; come to the dark side, we have cookies
       file-templates      ; auto-snippets for empty files
       fold                ; (nigh) universal code folding
       snippets            ; my elves. They type so I don't have to

       :emacs
       dired               ; making dired pretty [functional]
       electric            ; smarter, keyword-based electric-indent
       eww                 ; the internet is gross
       undo                ; persistent, smarter undo for your inevitable mistakes
       vc                  ; version-control and Emacs, sitting in a tree

       :term
       eshell              ; the elisp shell that works everywhere

       :tools
       ;;ansible
       editorconfig        ; let someone else argue about tabs vs spaces
       (eval +overlay)     ; run code, run (also, repls)
       lookup              ; navigate your code and its documentation
       magit               ; a git porcelain for Emacs
       make                ; run make tasks from Emacs
       terraform           ; infrastructure as code
       lsp
       ;;tmux              ; an API for interacting with tmux
       tree-sitter         ; syntax and parsing, sitting in a tree...

       :os
       (:if (featurep :system 'macos) macos)
       tty               ; improve the terminal Emacs experience

       :lang
       (cc +tree-sitter)           ; C > C++ == 1
       ;;clojure                   ; java with a lisp
       ;;common-lisp               ; if you've seen one lisp, you've seen them all
       (csharp +tree-sitter)       ; unity, .NET, and mono shenanigans
       ;;elixir                    ; erlang done right
       (emacs-lisp +tree-sitter)   ; drown in parentheses
       ;;erlang                    ; an elegant language for a more civilized age
       (go +tree-sitter)                 ; the hipster dialect
       ;;(haskell +lsp)            ; a language that's lazier than I am
       ;;json                      ; At least it ain't XML
       ;;(java +lsp)               ; the poster child for carpal tunnel syndrome
       ;;javascript                ; all(hope(abandon(ye(who(enter(here))))))
       ;;lua                       ; one-based indices? one-based indices
       (markdown +tree-sitter)     ; writing docs for people to ignore
       ;;nim                       ; python + lisp at the speed of c
       ;;ocaml                     ; an objective camel
       (org +tree-sitter)          ; organize your plain life in plain text
       (python +tree-sitter)       ; beautiful is better than ugly
       (rust +lsp +tree-sitter)         ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       (sh +tree-sitter)           ; she sells {ba,z,fi}sh shells on the C xor
       (swift +tree-sitter)        ; who asked for emoji variables?
       ;;yaml                      ; JSON, but readable
       ;;zig                       ; C, but simpler

       :app
       ;;calendar

       :config
       ;;literate
       (default +bindings +smartparens))
