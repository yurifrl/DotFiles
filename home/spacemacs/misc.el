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
;; [config] Elixir lsp mode config
(use-package lsp-mode
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook
  (elixir-mode . lsp)
  :init
  (add-to-list 'exec-path "/run/current-system/sw/bin/")
  (require 'dap-elixir)
  (setq flycheck-elixir-credo-strict t))

;; [elixir]
(require 'eglot)
;; This is optional. It automatically runs `M-x eglot` for you whenever you are in `elixir-mode`
(add-hook 'elixir-mode-hook 'eglot-ensure)
;; Make sure to edit the path appropriately, use the .bat script instead for Windows
(add-to-list 'eglot-server-programs '(elixir-mode "/run/current-system/sw/bin/"))
