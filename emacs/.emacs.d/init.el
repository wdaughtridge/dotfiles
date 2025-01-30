;; HACK Work around native compilation on macOS failing with 'ld: library not
;; found for -lemutls_w'.
;; https://github.com/d12frosted/homebrew-emacs-plus/issues/554
(setenv "LIBRARY_PATH"
	(string-join
	 '("/opt/homebrew/opt/gcc/lib/gcc/current"
	   "/opt/homebrew/opt/libgccjit/lib/gcc/current"
	   "/opt/homebrew/opt/gcc/lib/gcc/current/gcc/aarch64-apple-darwin24/14")
	 ":"))

;; Package setup for melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Disable tool bar
(tool-bar-mode -1)

;; Disable scroll bar
(scroll-bar-mode -1)

;; Disable window decorations
(add-to-list 'default-frame-alist '(undecorated-round . t))

;; Magit
(use-package magit
  :ensure t
  :bind (("C-c g" . magit-status)))

;; Projectile
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

;; DOOM themes 
(use-package doom-themes
  :ensure t)
(load-theme 'doom-badger)

;; Backup directory
(setq backup-directory-alist `(("." . "~/.saves")))

;; Treesitter
(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")
     (c3 "https://github.com/c3lang/tree-sitter-c3")
     (odin "https://github.com/tree-sitter-grammars/tree-sitter-odin")
     (c "https://github.com/tree-sitter/tree-sitter-c")))

;; Odin
(use-package odin-ts-mode
  :ensure t
  :vc (:url "https://github.com/Sampie159/odin-ts-mode" :branch "master")
  :mode ("\\.odin\\'" . odin-ts-mode))
