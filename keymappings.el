(setq mac-option-key-is-meta nil)
(setq mac-option-modifier nil)
(setq mac-command-modifier 'meta)
(setq mac-right-command-modifier nil)
(setq ns-function-modifier 'hyper)

(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-u") 'undo-tree-visualize)
(global-set-key (kbd "M-z") 'undo-tree-undo)
(global-set-key (kbd "M-y") 'undo-tree-redo)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-u") 'undo-tree-visualize)
(global-set-key (kbd "M-d") 'split-window-right)
(global-set-key (kbd "M-D") 'split-window-below)
(global-set-key (kbd "M-w") 'delete-window)
(global-set-key (kbd "M-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "M-p") 'projectile-find-file)
(global-set-key (kbd "C-s") 'phi-search)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "H-SPC") 'set-rectangular-region-anchor)

(define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
(define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)
(define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)
(define-key region-bindings-mode-map "m" 'mc/mark-more-like-this-extended)
(define-key region-bindings-mode-map "s" 'mc/skip-to-next-like-this)
(define-key region-bindings-mode-map "b" 'mc/edit-beginnings-of-lines)
(define-key region-bindings-mode-map "e" 'mc/edit-ends-of-lines)
(global-set-key (kbd "M-S-<mouse-1>") 'mc/add-cursor-on-click)

(global-set-key (kbd "M-F") 'sp-forward-sexp)
(global-set-key (kbd "M-B") 'sp-backward-sexp)
(global-set-key (kbd "M-P") 'sp-previous-sexp)
(global-set-key (kbd "M-N") 'sp-next-sexp)
(global-set-key (kbd "M-K") 'sp-kill-sexp)
