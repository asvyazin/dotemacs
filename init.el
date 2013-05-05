(ido-mode t)

;; egg-mode
(add-to-list 'load-path "~/.emacs.d/lisp/egg")
(autoload 'egg-status "egg" "Egg git mode." t)

;; paredit
(add-to-list 'load-path "~/.emacs.d/lisp/paredit")
(autoload 'paredit-mode "paredit" "Paredit mode." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))

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
