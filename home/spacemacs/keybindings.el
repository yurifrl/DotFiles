;; [config] Change buffer handler
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; Make C-c more powerfull
;; https://github.com/syl20bnr/spacemacs/issues/12133
(define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
;; [general, keybinds] Unbind C-z from evil-emacs-state that does i don't know what
(global-unset-key (kbd "C-z"))
;; [general, keybinds, package] Projectile keybinds
(with-eval-after-load 'projectile
  (define-key projectile-mode-map (kbd "C-c p") 'helm-projectile)
  (define-key projectile-mode-map (kbd "C-c s") 'helm-projectile-switch-project))
