;; [config] Neotree config
(setq neo-theme 'arrow)
(setq neo-show-hidden-files nil)
(winum-mode)
;; Hack to make sure 'company-lsp is only pushed after company package is loaded
(use-package company
  :config
  (push 'company-lsp company-backends))
;; [config] Fix dead-keys like ~ and `
(require 'iso-transl)

;; [elixir]
;; [config] Elixir lsp mode config
(use-package lsp-mode
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook
  (elixir-mode . lsp)
  :init
  (add-to-list 'exec-path (expand-file-name "~/.asdf/shims"))
  (require 'dap-elixir)
  (setq flycheck-elixir-credo-strict t))
;; Add envs for elixir-ls bash script
(setenv "PATH" (concat (getenv "PATH") ":" (expand-file-name "~/.asdf/shims")))
(setq exec-path (append exec-path (list (expand-file-name "~/.asdf/shims"))))
;;
(require 'eglot)
;; This is optional. It automatically runs `M-x eglot` for you whenever you are in `elixir-mode`
(add-hook 'elixir-mode-hook 'eglot-ensure)
;; Make sure to edit the path appropriately
;; (add-to-list 'eglot-server-programs '(elixir-mode "/run/current-system/sw/bin/"))
;;
(org-babel-do-load-languages
 'org-babel-load-languages
 '((elixir . t)))
