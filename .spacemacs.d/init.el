;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   dotspacemacs-configuration-layers
   '(
     sql
     shell-scripts
     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-use-company-box t)
     (python :variables
             python-backend 'lsp
             python-formatter 'yapf
             python-format-on-save t
             )
     (java :variables
           java-backend 'lsp
           )
     (go :variables
         go-backend 'lsp)
     emacs-lisp
     (javascript :variables
                 javascript-backend 'lsp
                 javascript-fmt-tool 'prettier
                 javascript-fmt-on-save t
                 javascript-import-tool 'import-js)
     typescript
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-backend 'lsp-clangd)
     rust
     html
     latex
     better-defaults
     ranger
     (git :variables
          git-magit-status-fullscreen t
          magit-push-always-verify nil
          magit-save-repository-buffers 'dontask
          magit-revert-buffers 'silent
          magit-refs-show-commit-count 'all
          magit-revision-show-gravatars nil)
     (ivy :variables ivy-enable-advanced-buffer-information nil)
     ;; lsp
     markdown
     ;;multiple-cursors
     (org :variables org-want-todo-bindings t)
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     (syntax-checking :variables
                      syntax-checking-enable-by-default nil
                      syntax-checking-enable-tooltips nil)
     (spell-checking :variables spell-checking-enable-by-default nil)
     ;; dap
     yaml
     latex
     (spacemacs-layouts :variables layouts-enable-autosave nil
                        layouts-autosave-delay 300)
     (chinese :variables
              chinese-default-input-method 'pinyin)
     treemacs
     version-control
     emacs-lisp
     ;;(my-better-default :location local)
     ;;(my-programming :location local)
     my-misc
     my-org
     my-ui
     )

   dotspacemacs-additional-packages '(posframe leetcode sicp ssh-agency anki-editor)
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages'()
   dotspacemacs-install-packages 'used-only
   dotspacemacs-delete-orphan-package t
   ))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-enable-emacs-pdumper nil
   dotspacemacs-emacs-pdumper-executable-file "emacs"
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-gc-cons '(100000000 0.1)
   dotspacemacs-use-spacelpa nil
   dotspacemacs-verify-spacelpa-archives t
   dotspacemacs-elpa-subdirectory 'emacs-version
   dotspacemacs-editing-style 'vim
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-new-empty-buffer-major-mode 'text-mode
   dotspacemacs-scratch-mode 'org-mode
   dotspacemacs-initial-scratch-message nil
   dotspacemacs-themes '(dracula
                         spacemacs-dark
                         spacemacs-light)

   dotspacemacs-mode-line-theme 'spacemacs
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10.0
                               :weight normal
                               :width normal)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-generate-layout-names nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.3
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-undecorated-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-enable-server nil
   dotspacemacs-server-socket-dir nil
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   dotspacemacs-frame-title-format "%I@%S"
   dotspacemacs-icon-title-format nil
   dotspacemacs-whitespace-cleanup nil
   dotspacemacs-zone-out-when-idle nil
   dotspacemacs-pretty-docs t))

(defun dotspacemacs/user-env ()
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  (setq url-gateway-method 'socks)
  (setq socks-server '("Default server" "127.0.0.1" 20170 5))
  (setq evil-shift-round nil)
  (setq byte-compile-warnings '(not obsolete))
  (setq warning-minimum-level :error)
  (setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
  (setq configuration-layer-elpa-archives
        '(("melpa-cn" . "http://mirrors.cloud.tencent.com/elpa/melpa/")
          ("org-cn"   . "http://mirrors.cloud.tencent.com/elpa/org/")
          ("gnu-cn"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")))

  ;; global hungry-delete-mode
  ;;(global-hungry-delete-mode t)
  (spacemacs|diminish projectile-mode)
  (spacemacs|diminish helm-gtags-mode)
  (spacemacs|diminish ggtags-mode)
  (spacemacs|diminish which-key-mode)
  (spacemacs|diminish spacemacs-whitespace-cleanup-mode)
  (spacemacs|diminish counsel-mode)

  ;; fix for the lsp error
  (defvar spacemacs-jump-handlers-fundamental-mode nil)

  ;; https://github.com/syl20bnr/spacemacs/issues/2705
  ;; (setq tramp-mode nil)
  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  (set-default 'lsp-java-server-install-dir "~/.lsp")


  )

(defun dotspacemacs/user-load ()
  )

(defun dotspacemacs/user-config ()
  (setq split-width-threshold 120)
  (spacemacs|add-company-backends :modes text-mode)

  ;; markdown-preview problem
  ;; fixed by installing discount(C implementation of John Gruber's Markdown markup language)
  )


(defun dotspacemacs/emacs-custom-settings ()
)
