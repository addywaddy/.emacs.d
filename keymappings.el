(setq mac-option-key-is-meta nil)
(setq mac-option-modifier nil)
(setq mac-command-modifier 'meta)
(setq mac-right-command-modifier nil)

(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-u") 'undo-tree-visualize)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-u") 'undo-tree-visualize)
(global-set-key (kbd "M-d") 'split-window-right)
(global-set-key (kbd "M-D") 'split-window-below)
(global-set-key (kbd "M-w") 'delete-window)
(global-set-key (kbd "M-q") 'save-buffers-kill-terminal)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "M-f") 'projectile-find-file)
