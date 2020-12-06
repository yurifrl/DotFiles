;; http://magnus.therning.org/posts/2019-09-19-000-haskell--ghcide--and-spacemacs.html
;; https://github.com/ssbothwell/dotfiles/blob/master/.spacemacs
;; [config] fix clipboard
(setq x-select-enable-clipboard t)
;; [config] Disable snippets
(setq lsp-enable-snippet nil)
;; [config] Setup scala lsp
(setq company-lsp-async t)
;; [config, js-mode] Indent level
(setq js-indent-level 2)
;; [config] Disable creation .tern-port
(setq tern-command '("/usr/bin/tern" "--no-port-file"))
;; [js2-mode] Disable semicolon warning
(setq js2-strict-missing-semi-warning nil)
;; [config] Always follow symlink
(setq vc-follow-symlinks t)
;; [config] Disable lock files '.# files'
(setq create-lockfiles nil)
;; [config] Remove duplciated entrys from emacs
(setq history-delete-duplicates t)
;; Hide hell buffers
(setq helm-boring-buffer-regexp-list (list (rx "*Messages") (rx "*eldoc")))
