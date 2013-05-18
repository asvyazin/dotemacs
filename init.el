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
(add-to-list 'load-path "~/.emacs.d/lisp/erlang")
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
(add-to-list 'load-path "~/.emacs.d/lisp/slime")
(setq inferior-lisp-program (getenv "CCL"))
(require 'slime)
(slime-setup '(slime-fancy))

;; slime-company
(add-to-list 'load-path "~/.emacs.d/lisp/slime-company")
(slime-setup '(slime-company))

;; factor-mode
(load "~/.emacs.d/lisp/fuel/fuel-1.0/fu.el")
(setq fuel-listener-factor-binary (executable-find "factor"))
(setq factor-binary-directory (file-name-directory fuel-listener-factor-binary))
(setq fuel-listener-factor-image (expand-file-name "factor.image" factor-binary-directory))

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
 '(custom-safe-themes (quote ("0268338ad854c131bafdecb4dbc8d3d60332e69a46e7639fd7929b4b5ef31ed2" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
