(setq select-enable-clipboard t)
(global-set-key (kbd "C-x k") 'kill-this-buffer)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq-default indent-tabs-mode nil)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-highlight-level (quote interactive))
 '(custom-enabled-themes (quote (smart-mode-line-dark base16-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("ef04dd1e33f7cbd5aa3187981b18652b8d5ac9e680997b45dc5d00443e6a46e3" "aed73c6d0afcf2232bb25ed2d872c7a1c4f1bda6759f84afc24de6a1aec93da8" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "6ebb2401451dc6d01cd761eef8fe24812a57793c5ccc427b600893fa1d767b1d" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "c56d90af9285708041991bbc780a073182cbe91721de17c6e7a8aac1380336b3" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "63fa843551cceac4958cc0e40e5e36c1ff79e39e1a4916017c225aca677de9d0" "0f68a45e03a507a51ae48c8fb5ec023254f972ead4d04d5813728d68f32970cc" "57cd4c79d719b74810f584d2afbbdb221334ab72077d50a875ce13ec54beadce" "e989d10979a9bd3230077945a8169cf6988cbc7ca7ca95fc7dfe373d573eea85" "ad665bdc1e81c420413cb105602ecb80c7b1f8d98a85b88164227d268c4f4f88" "2529be337b331d168deeed5a7fc257a62e5f252436f76851a30fb1b63e556e18" "01e169ce874985c2aa4ce4e3a3d5dbd6060d61457500120a557546d338901398" "134101847bd0a2ae22c72cbfda59cddf1039f9bb2b71e5ffd704feed5b409cfc" "c5a1d8f69dbc97c0158885b3c9e178a1bc75189745207c382c2d19dcf1dc91dd" "0268338ad854c131bafdecb4dbc8d3d60332e69a46e7639fd7929b4b5ef31ed2" default)))
 '(package-selected-packages
   (quote
    (dante company-nixos-options vdiff-magit vdiff avy scala-mode js2-refactor ess org-mode factor-mode purescript-mode mmm-mode ensime use-package clojure-mode-extra-font-locking flycheck-purescript idris-mode toml-mode browse-kill-ring cider deferred elm-mode git-commit haskell-snippets hydra js2-mode magit-popup psc-ide s which-key with-editor ansi auto-complete cask dash epl f flycheck flymake-go ghc names package-build pkg-info popup shut-up spinner yasnippet company haskell-mode rich-minority slime yaml-mode wrap-region virtualenv speed-type smex smartparens smart-mode-line slime-company shm scion rust-mode pymacs protobuf-mode projectile popwin paradox pallet nose nix-mode multiple-cursors markdown-mode magit livescript-mode iedit idomenu ido-vertical-mode highlight-indentation hi2 hamlet-mode god-mode go-snippets go-mode go-autocomplete fuel framemove flymake-yaml flymake-elixir flycheck-rust flycheck-hdevtools flycheck-haskell flycheck-cask flx-ido espuds ert-runner erlang elnode elixir-yasnippets elixir-mode edit-server drag-stuff discover-my-major company-go company-ghc company-cabal clojure-snippets clojure-mode base16-theme async alchemist aggressive-indent ace-jump-zap ace-jump-buffer)))
 '(paradox-automatically-star nil)
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq use-package-always-ensure t)
(require 'use-package)

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

;; company
(use-package company
  :init
  (setq company-dabbrev-downcase nil)
  :config
  (global-company-mode))
(use-package company-go
  :config
  (add-to-list 'company-backends 'company-go))
(use-package company-cabal
  :config
  (add-to-list 'company-backends 'company-cabal))

;; smartparens
(use-package smartparens
  :config
  (require 'smartparens-config)
  (sp-use-smartparens-bindings)
  (smartparens-global-mode t)
  (show-smartparens-global-mode t))

;; slime
;; clozure-cl must be installed
;; see http://ccl.clozure.com/manual/chapter2.3.html#command-line-setup
(use-package slime
  :config
  (setq inferior-lisp-program (executable-find "ccl"))
  (require 'slime-autoloads)
  (slime-setup '(slime-fancy)))
(use-package slime-company
  :config
  (slime-setup '(slime-company)))

;; erlang-mode
(use-package erlang
  :mode ("\\.erl$" . erlang-mode))

;; elixir-mode
(use-package elixir-mode
  :mode ("\\.ex$" . elixir-mode))
(use-package alchemist
  :commands (alchemist-mode)
  :init
  (add-hook 'elixir-mode-hook 'alchemist-mode))

;; haskell-mode
(use-package shm
  :commands structured-haskell-mode
  :init
  (add-hook 'haskell-mode-hook 'structured-haskell-mode))
(use-package haskell-mode
  :mode ("\\.?hs$" . haskell-mode))
(use-package dante
  :commands dante-mode
  :init
  (add-hook 'haskell-mode-hook 'dante-mode)
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  (add-hook 'dante-mode-hook '(lambda () (flycheck-add-next-checker 'haskell-dante '(warning . haskell-hlint)))))

(use-package hasky-extensions
  :bind ("C-c y" . hasky-extensions))

;; pymacs
(use-package pymacs
  :commands (pymacs-apply pymacs-call pymacs-call pymacs-eval pymacs-exec pymacs-load pymacs-autoload))

;; rope
;; Install rope, ropemode and ropemacs (pip install rope, pip install ropemode, pip install ropemacs). That's all!

;; factor-mode
;; factor executable should be in PATH
;; (setq fuel-listener-factor-binary (executable-find "factor"))
;; (setq factor-binary-directory (file-name-directory fuel-listener-factor-binary))
;; (setq fuel-listener-factor-image (expand-file-name "factor.image" factor-binary-directory))
(use-package fuel
  :mode ("\\.factor$" . factor-mode))

;; windmove
(use-package framemove
  :init
  (setq framemove-hook-into-windmove t)
  :config
  (windmove-default-keybindings))

;; projectile
(use-package projectile
  :config
  (projectile-global-mode))

(if (file-exists-p "~/.emacs.d/init.el.local")
    (load "~/.emacs.d/init.el.local"))

;; god-mode
(use-package god-mode
  :bind ("<escape>" . god-local-mode))

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
  :commands (aggressive-indent-mode)
  :init
  (add-hook 'emacs-lisp-mode-hook 'aggressive-indent-mode))

;; speed-type
(use-package speed-type
  :commands (speed-type))

;; smart-mode-line
(use-package smart-mode-line
  :config
  (sml/setup))

;; magit
(use-package magit
  :commands (magit-status)
  :init
  (setq magit-last-seen-setup-instructions "1.4.0"))

;; ora-test-emacs
(defun ora-test-emacs ()
  (interactive)
  (require 'async)
  (async-start
   (lambda () (shell-command-to-string
	       "emacs --batch --eval \"
(condition-case e
    (progn
      (load \\\"~/.emacs.d/init.el\\\")
      (message \\\"-OK-\\\"))
  (error
   (message \\\"ERROR!\\\")
   (signal (car e) (cdr e))))\""))
   `(lambda (output)
      (if (string-match "-OK-" output)
	  (when ,(called-interactively-p 'any)
	    (message "All is well"))
	(switch-to-buffer-other-window "*startup error*")
	(delete-region (point-min) (point-max))
	(insert output)
	(search-backward "ERROR!")))))

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

;; elm-mode
(use-package elm-mode
  :mode ("\\.elm$" . elm-mode)
  :init
  (add-hook 'elm-mode-hook 'elm-oracle-setup-completion))

;; purescript
(use-package purescript-mode
  :mode ("\\.purs$" . purescript-mode)
  :init
  (add-hook
   'purescript-mode-hook
   (lambda ()
     (require 'haskell-mode)
     (turn-on-haskell-indentation))))
(use-package psc-ide
  :commands (psc-ide-mode)
  :init
  (add-hook 'purescript-mode-hook 'psc-ide-mode)
  (add-hook 'psc-ide-mode-hook 'flycheck-mode)
  (add-hook 'psc-ide-mode-hook 'psc-ide-flycheck-setup))

;; scala-mode
(use-package scala-mode
  :mode (("\\.scala$" . scala-mode)
	 ("\\.sbt$" . sbt-mode)))
(use-package ensime
  :pin melpa-stable
  :commands (ensime-mode)
  :init
  (add-hook 'scala-mode-hook (lambda ()
			       (require 'ensime)
			       (ensime-mode))))

(use-package paradox
  :commands (paradox-list-packages))

(use-package org
  :mode ("\\.org$" . org-mode))

;; ess
(use-package ess
  :commands (R S)
  :mode ("\\.R$" . R-mode))

;; js2
(use-package js2-mode
  :mode (("\\.js$" . js2-mode)
	 ("\\.jsx$" . js2-jsx-mode)))
(use-package js2-refactor
  :defer t
  :commands (js2-refactor-mode)
  :init
  (add-hook 'js2-mode-hook 'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-m"))

(use-package which-key
  :commands (which-key-mode))

(use-package nix-mode
  :mode ("\\.nix$" . nix-mode))

(use-package yaml-mode
  :mode ("\\.yaml$" . yaml-mode))

;; protobuf
(use-package protobuf-mode
  :mode "\\.proto$")

(load-file (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate")))
