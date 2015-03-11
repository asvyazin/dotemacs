(require 'cask "~/.cask/cask.el")
(cask-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (base16-solarized)))
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "c56d90af9285708041991bbc780a073182cbe91721de17c6e7a8aac1380336b3" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "63fa843551cceac4958cc0e40e5e36c1ff79e39e1a4916017c225aca677de9d0" "0f68a45e03a507a51ae48c8fb5ec023254f972ead4d04d5813728d68f32970cc" "57cd4c79d719b74810f584d2afbbdb221334ab72077d50a875ce13ec54beadce" "e989d10979a9bd3230077945a8169cf6988cbc7ca7ca95fc7dfe373d573eea85" "ad665bdc1e81c420413cb105602ecb80c7b1f8d98a85b88164227d268c4f4f88" "2529be337b331d168deeed5a7fc257a62e5f252436f76851a30fb1b63e556e18" "01e169ce874985c2aa4ce4e3a3d5dbd6060d61457500120a557546d338901398" "134101847bd0a2ae22c72cbfda59cddf1039f9bb2b71e5ffd704feed5b409cfc" "c5a1d8f69dbc97c0158885b3c9e178a1bc75189745207c382c2d19dcf1dc91dd" "0268338ad854c131bafdecb4dbc8d3d60332e69a46e7639fd7929b4b5ef31ed2" default)))
 '(package-selected-packages
   (quote
    (company haskell-mode rich-minority slime yaml-mode wrap-region virtualenv speed-type smex smartparens smart-mode-line slime-company shm scion scala-mode2 rust-mode pymacs protobuf-mode projectile popwin paradox pallet nose nix-mode multiple-cursors markdown-mode magit livescript-mode iedit idomenu ido-vertical-mode highlight-indentation hi2 hamlet-mode god-mode go-snippets go-mode go-autocomplete fuel framemove flymake-yaml flymake-elixir flycheck-rust flycheck-hdevtools flycheck-haskell flycheck-cask flx-ido espuds ert-runner erlang elnode elixir-yasnippets elixir-mode edit-server drag-stuff discover-my-major company-go company-ghc company-cabal clojure-snippets clojure-mode base16-theme async alchemist aggressive-indent ace-jump-zap ace-jump-buffer)))
 '(paradox-automatically-star nil)
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(ido-mode t)
(setq x-select-enable-clipboard t)
(tool-bar-mode -1)

;; pallet-mode
(require 'pallet)
(pallet-mode t)

;;smex
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; yasnippet
(yas-global-mode 1)

;; company
(require 'company)
(global-company-mode)
(add-to-list 'company-backends 'company-ghc)
(add-to-list 'company-backends 'company-go)
(add-to-list 'company-backends 'company-cabal)

;; smartparens
(require 'smartparens-config)
(sp-use-smartparens-bindings)
(smartparens-global-mode t)
(show-smartparens-global-mode t)

;; slime
;; clozure-cl must be installed
;; see http://ccl.clozure.com/manual/chapter2.3.html#command-line-setup 
(setq inferior-lisp-program (executable-find "ccl"))
(require 'slime-autoloads)
(slime-setup '(slime-fancy))

;; slime-company
(slime-setup '(slime-company))

;; erlang-mode
(require 'erlang-flymake)

;; elixir-mode
(require 'alchemist)
(alchemist-mode 1)

;; haskell-mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(setq haskell-process-suggest-remove-import-lines t)
(setq haskell-process-auto-import-loaded-modules t)
(setq haskell-process-log t)
(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
(setq haskell-process-type 'cabal-repl)

;; ghc-mod
;; you should have ghc-mod util already installed
(add-to-list 'exec-path "~/.cabal/bin")

(add-hook 'haskell-mode-hook 'ghc-init)
(add-hook 'haskell-mode-hook 'flycheck-mode)
(add-hook 'haskell-mode-hook 'turn-on-hi2)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))
; (eval-after-load 'flycheck '(require 'flycheck-hdevtools))

;; flycheck
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-cask-setup))

;; pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

;; rope
;; Install rope, ropemode and ropemacs (pip install rope, pip install ropemode, pip install ropemacs). That's all!

;; factor-mode
;; factor executable should be in PATH
;; (setq fuel-listener-factor-binary (executable-find "factor"))
;; (setq factor-binary-directory (file-name-directory fuel-listener-factor-binary))
;; (setq fuel-listener-factor-image (expand-file-name "factor.image" factor-binary-directory))

;; windmove
(windmove-default-keybindings)

;; framemove
(setq framemove-hook-into-windmove t)

;; projectile
(projectile-global-mode)

(if (file-exists-p "~/.emacs.d/init.el.local")
    (load "~/.emacs.d/init.el.local"))

;; god-mode
(global-set-key (kbd "<escape>") 'god-local-mode)

;; edit-server
(require 'edit-server)
(edit-server-start)

;; ace-jump-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-c b") 'ace-jump-buffer)

;; aggressive-indent-mode
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)

;; speed-type
(autoload 'speed-type-text "speed-type" nil t)

;; smart-mode-line
(sml/setup)

;; paradox
(setq paradox-execute-asynchronously t)

;; server-start
(require 'server)
(unless (server-running-p)
  (server-start))
