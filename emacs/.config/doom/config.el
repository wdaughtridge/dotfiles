;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "0xProto Nerd Font" :size 14 :weight 'normal))

(setq doom-theme 'wombat)

(setq display-line-numbers-type t)

(require 'view)
(global-set-key (kbd "M-v") 'View-scroll-half-page-backward)
(global-set-key (kbd "C-v") 'View-scroll-half-page-forward)

(setq org-directory "~/Developer/org/")

;; Disable automatic workspace creation on project switch
(setq +workspaces-on-switch-project-behavior nil)

;; Preserve workspace name when switching projects
(defadvice! my/preserve-workspace-name-a (orig-fn &rest args)
  :around #'projectile-switch-project
  (let ((current-persp-name (safe-persp-name (get-current-persp))))
    (apply orig-fn args)
    (when (and (bound-and-true-p persp-mode)
               (get-current-persp)
               (not (string= current-persp-name (safe-persp-name (get-current-persp)))))
      (persp-rename current-persp-name))))
