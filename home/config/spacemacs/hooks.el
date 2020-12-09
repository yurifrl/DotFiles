;; elixir-format on save
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
;; [config] Enable smartparens
(add-hook 'prog-mode-hook #'smartparens-mode)
;; [config] Enable raimbow parenthesis
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;; [general, package] Projectile enable cache
;; (setq projectile-enable-caching nil)
;; [general] Delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
