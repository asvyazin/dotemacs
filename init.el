(ido-mode t)
(tool-bar-mode -1)
(setq x-select-enable-clipboard t)
(tool-bar-mode -1)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(require 'typescript "~/.emacs.d/lisp/TypeScript/TypeScript.el")

;;smex
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; yasnippet
(yas-global-mode 1)

;; go
(add-to-list 'load-path "~/.emacs.d/lisp/goflymake")
(require 'go-flymake)
(require 'go-flycheck)

;; company
(add-hook 'after-init-hook 'global-company-mode)

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
(add-to-list 'load-path "~/.emacs.d/lisp/slime-company")
(slime-setup '(slime-company))

;; erlang-mode
(require 'erlang-flymake)

;; distel
;; run 'make' in ~/.emacs.d/lisp/distel
;; wrangler
;; run ./configure and make in ~/.emacs.d/lisp/wrangler (works only on UNIX)
;; read INSTALL in wrangler directory and configure .erlang file
;; on Windows use environment variable ERL_LIBS (read http://www.erlang.org/doc/man/code.html)
(add-to-list 'load-path "~/.emacs.d/lisp/wrangler/elisp")
(add-to-list 'load-path "~/.emacs.d/lisp/distel/elisp")
(require 'wrangler)

;; lilypond-mode
(add-to-list 'load-path "~/.emacs.d/lisp/lilypond")
(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))

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

;(add-hook 'haskell-mode-hook 'ghc-init)
(add-hook 'haskell-mode-hook 'flycheck-mode)
(add-hook 'haskell-mode-hook 'turn-on-hi2)
;(eval-after-load 'flycheck
;  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))
(eval-after-load 'flycheck '(require 'flycheck-hdevtools))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (base16-solarized)))
 '(custom-safe-themes (quote ("de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "63fa843551cceac4958cc0e40e5e36c1ff79e39e1a4916017c225aca677de9d0" "0f68a45e03a507a51ae48c8fb5ec023254f972ead4d04d5813728d68f32970cc" "57cd4c79d719b74810f584d2afbbdb221334ab72077d50a875ce13ec54beadce" "e989d10979a9bd3230077945a8169cf6988cbc7ca7ca95fc7dfe373d573eea85" "ad665bdc1e81c420413cb105602ecb80c7b1f8d98a85b88164227d268c4f4f88" "2529be337b331d168deeed5a7fc257a62e5f252436f76851a30fb1b63e556e18" "01e169ce874985c2aa4ce4e3a3d5dbd6060d61457500120a557546d338901398" "134101847bd0a2ae22c72cbfda59cddf1039f9bb2b71e5ffd704feed5b409cfc" "c5a1d8f69dbc97c0158885b3c9e178a1bc75189745207c382c2d19dcf1dc91dd" "0268338ad854c131bafdecb4dbc8d3d60332e69a46e7639fd7929b4b5ef31ed2" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
