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
;; [config, lsp] Make lsp faster http://blog.binchen.org/posts/how-to-speed-up-lsp-mode.html
(with-eval-after-load 'lsp-mode
  ;; Disable lsp file watcher
  ;; Stop that annoying msg
  (setq lsp-enable-file-watchers nil)
  ;; Auto restart lsp
  (setq lsp-restart 'auto-restart)
  ;; ignore stuff
  ;; does't seam to work
  (push "[/\\\\][^/\\\\]*\\.\\(json\\|html\\|jade\\)$" lsp-file-watch-ignored)
  (push "*_build" lsp-file-watch-ignored))
;;
;; Hidde buffers that start with
(with-eval-after-load 'helm-buffers
  (setq helm-boring-buffer-regexp-list '("^*" "^\s")))
