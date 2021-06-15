(setq select-enable-clipboard t)
(global-set-key (kbd "C-x k") 'kill-this-buffer)

(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

(setq-default indent-tabs-mode nil)

(defun try-add-exec-path (path)
  (if (and (file-exists-p path)
           (not (member path exec-path)))
      (add-to-list 'exec-path path)))

(try-add-exec-path "/usr/local/bin")

;; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq straight-use-package-by-default t)
(setq debug-on-error t)

(straight-use-package 'use-package)
(require 'use-package)

(use-package base16-theme)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(smart-mode-line-dark base16-solarized-dark))
 '(custom-safe-themes
   '("8f4fb38b202ca52d25bdf842dff3143d74dc3ddef8b4b3a9094e0ce7b84dd2f2" "fede08d0f23fc0612a8354e0cf800c9ecae47ec8f32c5f29da841fe090dfc450" "ef04dd1e33f7cbd5aa3187981b18652b8d5ac9e680997b45dc5d00443e6a46e3" "aed73c6d0afcf2232bb25ed2d872c7a1c4f1bda6759f84afc24de6a1aec93da8" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "6ebb2401451dc6d01cd761eef8fe24812a57793c5ccc427b600893fa1d767b1d" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "c56d90af9285708041991bbc780a073182cbe91721de17c6e7a8aac1380336b3" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "63fa843551cceac4958cc0e40e5e36c1ff79e39e1a4916017c225aca677de9d0" "0f68a45e03a507a51ae48c8fb5ec023254f972ead4d04d5813728d68f32970cc" "57cd4c79d719b74810f584d2afbbdb221334ab72077d50a875ce13ec54beadce" "e989d10979a9bd3230077945a8169cf6988cbc7ca7ca95fc7dfe373d573eea85" "ad665bdc1e81c420413cb105602ecb80c7b1f8d98a85b88164227d268c4f4f88" "2529be337b331d168deeed5a7fc257a62e5f252436f76851a30fb1b63e556e18" "01e169ce874985c2aa4ce4e3a3d5dbd6060d61457500120a557546d338901398" "134101847bd0a2ae22c72cbfda59cddf1039f9bb2b71e5ffd704feed5b409cfc" "c5a1d8f69dbc97c0158885b3c9e178a1bc75189745207c382c2d19dcf1dc91dd" "0268338ad854c131bafdecb4dbc8d3d60332e69a46e7639fd7929b4b5ef31ed2" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ido
(use-package ido
  :config
  (ido-mode t))

;;smex
(use-package smex
  :config
  (smex-initialize)
  :bind
  (("M-x" . smex)
   ("M-X" . smex-major-mode-commands)
   ("C-c C-c M-x" . execute-extended-command)))

;; yasnippet
(use-package yasnippet
  :config
  (yas-global-mode 1))
(use-package yasnippet-snippets)

;; company
(use-package company
  :init
  (setq company-dabbrev-downcase nil)
  :config
  (global-company-mode))
(use-package company-go
  :after company
  :config
  (add-to-list 'company-backends 'company-go))
(use-package company-cabal
  :after company
  :config
  (add-to-list 'company-backends 'company-cabal))

;; smartparens
(use-package smartparens
  :config
  (require 'smartparens-config)
  (sp-use-smartparens-bindings)
  (smartparens-global-mode t)
  (show-smartparens-global-mode t))

;; sly
;; clozure-cl must be installed
;; see http://ccl.clozure.com/manual/chapter2.3.html#command-line-setup
(use-package sly
  :config
  (setq inferior-lisp-program (or (executable-find "ccl64")
                                  (executable-find "ccl"))))
(use-package sly-quicklisp
  :after sly)
(use-package sly-asdf
  :after sly
  :config
  (add-to-list 'sly-contribs 'sly-asdf 'append))

;; erlang-mode
(use-package erlang)

;; elixir-mode
(use-package elixir-mode)
(use-package alchemist
  :hook (elixir-mode . alchemist-mode))

;; ocaml
(use-package tuareg)

(add-to-list 'exec-path (expand-file-name "~/.opam/default/bin"))
(use-package merlin
  :after company
  :hook (tuareg-mode . merlin-mode)
  :config
  (add-to-list 'company-backends 'merlin-company-backend))

;; haskell-mode
(add-to-list 'exec-path (expand-file-name "~/.local/bin"))
(add-to-list 'exec-path (expand-file-name "~/.cabal/bin"))
(use-package shm
  :after haskell-mode
  :hook (haskell-mode . structured-haskell-mode))
(use-package haskell-mode
  :bind ([f8] . haskell-navigate-imports-go)
  :bind ([f9] . haskell-navigate-imports-return))
(use-package lsp-haskell
  :after lsp-mode
  :after haskell-mode
  :hook (haskell-mode . lsp))
(use-package ormolu
 :hook (haskell-mode . ormolu-format-on-save-mode)
 :bind
 (:map haskell-mode-map
   ("C-c r" . ormolu-format-buffer)))

(use-package hasky-extensions
  :bind ("C-c y" . hasky-extensions))

;; factor-mode
;; factor executable should be in PATH
;; (setq fuel-listener-factor-binary (executable-find "factor"))
;; (setq factor-binary-directory (file-name-directory fuel-listener-factor-binary))
;; (setq fuel-listener-factor-image (expand-file-name "factor.image" factor-binary-directory))
;;(use-package fuel)

;; projectile
(use-package projectile
  :config
  (projectile-global-mode))

(if (file-exists-p "~/.emacs.d/init.el.local")
    (load "~/.emacs.d/init.el.local"))

;; edit-server
(use-package edit-server
  :init
  (add-hook 'after-init-hook 'edit-server-start t)
  (add-hook 'after-init-hook 'server-start t))

;; ace-jump-mode
(use-package ace-jump-mode
  :bind (("C-c SPC" . ace-jump-mode)
	 ("C-c b" . ace-jump-buffer)))

;; avy
(use-package avy
  :bind (("C-:" . avy-goto-char)
	 ("C-'" . avy-goto-char-2)
	 ("M-g f" . avy-goto-line)
	 ("M-g w" . avy-goto-word-1)
	 ("M-g e" . avy-goto-word-0)))

;; aggressive-indent-mode
(use-package aggressive-indent
  :hook (emacs-list-mode . aggressive-indent))

;; speed-type
(use-package speed-type)

;; smart-mode-line
(use-package smart-mode-line
  :config
  (sml/setup))

;; magit
(use-package magit
  :init
  (setq magit-last-seen-setup-instructions "1.4.0")
  :bind (:map ido-common-completion-map ("C-x g" . ido-enter-magit-status)))

;; mmm-mode
(use-package mmm-mode
  :init
  (setq mmm-global-mode 'maybe)
  :config
  (mmm-add-classes
   '((hamlet-quasiquote
      :submode hamlet-mode
      :delimiter-mode nil
      :front "\\[[wx]?hamlet|"
      :back "|\\]")
     (js2-quasiquote
      :submode js-mode
      :delimiter-mode nil
      :front "\\[julius|"
      :back "|\\]")
     (html-js-quasiquote
      :submode js-mode
      :delimiter-mode nil
      :front "<script[^>]*>"
      :back "</script>")
     (R-quasiquote
      :submode R-mode
      :delimiter-mode nil
      :front "\\[r|"
      :back "|\\]")))
  (mmm-add-mode-ext-class 'haskell-mode nil 'hamlet-quasiquote)
  (mmm-add-mode-ext-class 'haskell-mode nil 'js2-quasiquote)
  (mmm-add-mode-ext-class 'html-mode nil 'html-js-quasiquote)
  (mmm-add-mode-ext-class 'haskell-mode nil 'R-quasiquote))

;; purescript
(use-package purescript-mode
  :hook (purescript-mode . turn-on-purescript-indentation)
  :hook (purescript-mode . format-all-mode))
(use-package psc-ide
  :after purescript-mode
  :hook (purescript-mode . psc-ide-mode)
  :hook (psc-ide-mode . flycheck-mode)
  :hook (psc-ide-mode . psc-ide-flycheck-setup))

;; scala-mode
(use-package scala-mode)
(use-package lsp-mode
  :after scala-mode
  :hook (scala-mode . lsp)
  :hook lsp-lens-mode)
(use-package lsp-ui)
(use-package lsp-metals)

(use-package org)

;; ess
(use-package ess)

;; js2
(use-package js2-mode
  :mode (("\\.js$" . js2-mode)
	 ("\\.jsx$" . js2-jsx-mode)))
(use-package js2-refactor
  :defer t
  :hook (js2-mode . js2-refactor-mode)
  :init
  (js2r-add-keybindings-with-prefix "C-c C-m"))

(use-package which-key)

(use-package nix-mode)

(use-package yaml-mode)

;; protobuf
(use-package protobuf-mode)

;; csharp
(use-package omnisharp
  :after (csharp-mode company)
  :hook (csharp-mode . omnisharp-mode)
  :hook (csharp-mode . flycheck-mode)
  :init (setq omnisharp-server-executable-path "omnisharp")
  :init (add-to-list 'company-backends 'company-omnisharp))

;; clojure
(use-package cider)

;; Agda
(if (executable-find "agda-mode")
    (let* ((coding-system-for-read 'utf-8)
           (agda-mode-file (shell-command-to-string "agda-mode locate")))
      (if (file-exists-p agda-mode-file)
          (load-file agda-mode-file))))

;; unicode-fonts
(use-package unicode-fonts
  :config (unicode-fonts-setup))

;; forth-mode
(use-package forth-mode)

;; dhall-mode
(use-package dhall-mode)

;; mercury-mode
(use-package metal-mercury-mode
  :straight
  (metal-mercury-mode :type git :host github :repo "fabnicol/metal-mercury-mode" :branch "main"))

;; format-all
(use-package format-all)
