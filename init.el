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
