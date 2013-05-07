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
