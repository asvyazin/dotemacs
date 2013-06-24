(ido-mode t)

;; egg-mode
(add-to-list 'load-path "~/.emacs.d/lisp/egg")
(autoload 'egg-status "egg" "Egg git mode." t)

;; smartparens
(add-to-list 'load-path "~/.emacs.d/lisp/dash")
(add-to-list 'load-path "~/.emacs.d/lisp/smartparens")
(require 'smartparens-config)
(sp-use-smartparens-bindings)
(smartparens-global-mode t)

;; smex
(add-to-list 'load-path "~/.emacs.d/lisp/smex")
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; company-mode
(add-to-list 'load-path "~/.emacs.d/lisp/company-mode")
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; cl-lib
(add-to-list 'load-path "~/.emacs.d/lisp/cl-lib")

;; magit
(add-to-list 'load-path "~/.emacs.d/lisp/magit")
(require 'magit)

;; erlang-mode
(add-to-list 'load-path "~/.emacs.d/lisp/erlang-mode")
(require 'erlang-start)
(require 'erlang-flymake)

;; distel
;; run 'make' in ~/.emacs.d/lisp/distel
(add-to-list 'load-path "~/.emacs.d/lisp/distel/elisp")
(autoload 'distel-erlang-mode-hook "distel" nil t)
(add-hook 'erlang-mode-hook 'distel-erlang-mode-hook)
(setq inferior-erlang-machine-options
      (list "-sname" "emacs"
	    "-pz" (expand-file-name "~/.emacs.d/lisp/distel/ebin")
	    "-pz" (expand-file-name "~/.emacs.d/lisp/wrangler/ebin")))

;; wrangler
;; run ./configure and make in ~/.emacs.d/lisp/wrangler (works only on UNIX)
(add-to-list 'load-path "~/.emacs.d/lisp/wrangler/elisp")
(autoload 'wrangler-menu-init "wrangler" nil t)
(add-hook 'erlang-mode-hook 'wrangler-menu-init)

;; elixir-mode
(add-to-list 'load-path "~/.emacs.d/lisp/emacs-elixir")
(require 'elixir-mode-setup)
(elixir-mode-setup)

;; yasnippet
(add-to-list 'load-path
              "~/.emacs.d/lisp/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; haskell-mode
(load "~/.emacs.d/lisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; ghc-mod
;; you should have ghc-mod util already installed
(add-to-list 'exec-path "~/.cabal/bin")
(add-to-list 'load-path "~/.emacs.d/lisp/ghc-mod")
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

;; slime
;; clozure-cl must be installed
;; see http://ccl.clozure.com/manual/chapter2.3.html#command-line-setup 
(add-to-list 'load-path "~/.emacs.d/lisp/slime")
(setq inferior-lisp-program (executable-find "ccl"))
(require 'slime)
(slime-setup '(slime-fancy))

;; slime-company
(add-to-list 'load-path "~/.emacs.d/lisp/slime-company")
(slime-setup '(slime-company))

;; factor-mode
;; factor executable should be in PATH
(load "~/.emacs.d/lisp/fuel/fuel-1.0/fu.el")
;; (setq fuel-listener-factor-binary (executable-find "factor"))
;; (setq factor-binary-directory (file-name-directory fuel-listener-factor-binary))
;; (setq fuel-listener-factor-image (expand-file-name "factor.image" factor-binary-directory))

;; base16
(load "~/.emacs.d/lisp/base16/base16-theme-autoloads.el")

;; pymacs
;; build pymacs in lisp/pymacs first
(add-to-list 'load-path "~/.emacs.d/lisp/pymacs")
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

;; rope
;; Install rope, ropemode and ropemacs (pip install rope, pip install ropemode, pip install ropemacs). That's all!

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (base16-solarized)))
 '(custom-safe-themes (quote ("63fa843551cceac4958cc0e40e5e36c1ff79e39e1a4916017c225aca677de9d0" "0f68a45e03a507a51ae48c8fb5ec023254f972ead4d04d5813728d68f32970cc" "57cd4c79d719b74810f584d2afbbdb221334ab72077d50a875ce13ec54beadce" "e989d10979a9bd3230077945a8169cf6988cbc7ca7ca95fc7dfe373d573eea85" "ad665bdc1e81c420413cb105602ecb80c7b1f8d98a85b88164227d268c4f4f88" "2529be337b331d168deeed5a7fc257a62e5f252436f76851a30fb1b63e556e18" "01e169ce874985c2aa4ce4e3a3d5dbd6060d61457500120a557546d338901398" "134101847bd0a2ae22c72cbfda59cddf1039f9bb2b71e5ffd704feed5b409cfc" "c5a1d8f69dbc97c0158885b3c9e178a1bc75189745207c382c2d19dcf1dc91dd" "0268338ad854c131bafdecb4dbc8d3d60332e69a46e7639fd7929b4b5ef31ed2" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
