;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; General Configuration
(setq user-full-name "Scarlett"
     user-mail-address "")

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-hook 'window-setup-hook #'doom-display-benchmark-h)

(setq
      ;; doom-font (font-spec :family "Fira Code" :size 16)
      ;; doom-variable-pitch-font (font-spec :family "Alegreya" :size 16)
      ;; doom-font (font-spec :family "Iosevka" :size 18 :weight 'light)
      ;; doom-font (font-spec :family "Source Code Pro" :size 16 :weight 'bold)
      doom-font (font-spec :family "Source Code Pro for Powerline" :size 20)
)

;; Doom Dashboard
(setq fancy-splash-image "~/dotfiles/emacs-logo.png")
(setq +doom-dashboard-banner-padding '(4 . 4))
(setq +doom-dashboard-menu-sections
    '(("Reload last session"
      :icon (all-the-icons-octicon "history" :face 'doom-dashboard-menu-title)
      :when (cond ((require 'persp-mode nil t)
                    (file-exists-p (expand-file-name persp-auto-save-fname persp-save-dir)))
                  ((require 'desktop nil t)
                    (file-exists-p (desktop-full-file-name))))
      :face (:inherit (doom-dashboard-menu-title bold))
      :action doom/quickload-session)
      ;; ("Open org-agenda"
      ;; :icon (all-the-icons-octicon "calendar" :face 'doom-dashboard-menu-title)
      ;; :when (fboundp 'org-agenda)
      ;; :action org-agenda)
      ("Open project"
      :icon (all-the-icons-octicon "briefcase" :face 'doom-dashboard-menu-title)
      :action projectile-switch-project)
      ("Jump to bookmark"
      :icon (all-the-icons-octicon "bookmark" :face 'doom-dashboard-menu-title)
      :action bookmark-jump)))

(setq auto-save-default t
      make-backup-files t)

(setq confirm-kill-emacs nil)

(defconst doom-frame-transparency 100)
(set-frame-parameter (selected-frame) 'alpha doom-frame-transparency)
(add-to-list 'default-frame-alist `(alpha . ,doom-frame-transparency))
(defun dwc-smart-transparent-frame ()
  (set-frame-parameter
    (selected-frame)
    'alpha (if (frame-parameter (selected-frame) 'fullscreen)
              100
             doom-frame-transparency)))

(setq doom-theme 'doom-one)
(map! :leader
      :desc "Load new theme" "h t" #'counsel-load-theme)

;; (load-theme 'afternoon t)

(custom-set-faces!
  '(doom-dashboard-banner :inherit default)
  '(doom-dashboard-loaded :inherit default))

(setq-default word-wrap t)
(toggle-truncate-lines -1)

(setq org-directory "~/org/")

(setq display-line-numbers-type t)

(setq
 org-superstar-headline-bullets-list '("◉" "○" "✸" "✿" "⁖")
)
;; (setq org-ellipsis " ⤵ ")
(setq org-ellipsis " ▼ ")

(use-package elpy
      :ensure t
      :init
      (elpy-enable))

(use-package company
    :ensure t
    :config
    (setq company-idle-delay 0.5)
    (add-hook 'after-init-hook 'global-company-mode)
    ;;(setq company-minimum-prefix-length 3)
    )

(after! elpy
  (set-company-backend! 'elpy-mode
    '(elpy-company-backend :with company-files company-yasnippet)))

;; (use-package
;;   elpy
;;   :ensure t
;;   :commands elpy-enable
;;   :after company
;;   :config
;;   (setq elpy-modules '(elpy-module-company
;; 		       elpy-module-pyvenv
;; 		       elpy-module-highlight-indentation
;; 		       elpy-module-sane-defaults
;; 		       elpy-module-yasnippet))
;;   )

(use-package python
  :mode ("\\.py" . python-mode)
  :ensure t
  ;; :init
  ;; (add-hook 'python-mode-hook #'elpy-enable)
  )

;; (use-package pyvenv)

;; Doom Modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
)
(setq doom-modeline-height 25)
(setq doom-modeline-bar-width 4)
(setq doom-modeline-window-width-limit fill-column)
(setq doom-modeline-project-detection 'auto)
(setq doom-modeline-buffer-file-name-style 'auto)
(setq doom-modeline-icon (display-graphic-p))
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-buffer-modification-icon t)
(setq doom-modeline-unicode-fallback nil)
(setq doom-modeline-minor-modes nil)
(setq doom-modeline-enable-word-count nil)
(setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))
(setq doom-modeline-buffer-encoding t)
(setq doom-modeline-checker-simple-format t)
(setq doom-modeline-number-limit 99)
(setq doom-modeline-vcs-max-length 12)
(setq doom-modeline-workspace-name t)
(setq doom-modeline-persp-name t)
(setq doom-modeline-display-default-persp-name nil)
(setq doom-modeline-persp-icon t)
(setq doom-modeline-lsp t)
(setq doom-modeline-github nil)
(setq doom-modeline-github-interval (* 30 60))
(setq doom-modeline-modal-icon t)
(setq doom-modeline-gnus t)
(setq doom-modeline-gnus-timer 2)
(setq doom-modeline-gnus-excluded-groups '("dummy.group"))
(setq doom-modeline-irc t)
(setq doom-modeline-irc-stylize 'identity)
(setq doom-modeline-env-version t)
(setq doom-modeline-env-enable-python t)
(setq doom-modeline-env-python-executable "python") ; or `python-shell-interpreter'
(setq doom-modeline-env-load-string "...")
(setq doom-modeline-before-update-env-hook nil)
(setq doom-modeline-after-update-env-hook nil)

(setq +format-on-save-enabled-modes
  '(not emacs-lisp-mode
        python-mode
        json-mode
        sql-mode
        tex-mode
        org-mode
        latex-mode))

;; Avoid Warning
(require 'loadhist)
(file-dependents (feature-file 'cl))
